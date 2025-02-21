# frozen_string_literal: true

class Week
  def initialize(kid:, week: nil)
    week ||= Date.current.all_week

    @week = week.is_a?(Range) ? week : week.all_week
    @kid = kid
  end

  def begin
    week.first
  end

  def end
    week.last
  end

  def previous
    @previous ||= self.class.new(kid:, week: self.begin - 1.week)
  end

  def next
    @next ||= self.class.new(kid:, week: self.end + 1.week)
  end

  def days
    @days ||= week.map do |day|
      Day.new(kid, day, chores, daily_chores.for_day(day))
    end
  end

  def satisfied_days
    @satisfied_days ||= days.reject(&:future?).select(&:satisfied?)
  end

  def chores
    @chores ||= kid.chores
  end

  def future?
    self.begin.future?
  end

  def before_kid?
    @before_kid ||= days.any?(&:before_kid?) || self.begin == kid.created_at
  end

  def include_kid?
    @include_kid ||= self.end < kid.created_at
  end

  def satisfied?
    @satisfied ||= days.all?(&:satisfied?)
  end

  def fully_satisfied?
    @fully_satisfied ||= satisfied_days.count == 7
  end

  # Reject today and all the days in the future.
  # Also reject days before the kid creation.
  def past_days
    @past_days ||= days.select { |day| day.past? && !day.before_kid? }
  end

  def last_unsatisfied_day
    @last_unsatisfied_day ||= past_days.reverse.find { |day| !day.satisfied? }
  end

  def first_satisfied_day
    @first_satisfied_day ||= begin
      if last_unsatisfied_day
        past_days.select { _1.day > last_unsatisfied_day.day }.first
      else
        past_days.reverse.reduce(nil) { |res, day| day.satisfied? ? day : res }
      end
    end
  end

  def last_satisfied_day
    @last_satisfied_day ||= past_days.reduce(nil) { |res, day| week_day.satisfied? ? day : res }
  end

  private

  attr_reader :week, :kid

  def daily_chores
    @daily_chores ||= kid.daily_chores
  end

  class Day
    attr_reader :kid, :day, :chores, :daily_chores

    delegate :past?, :future?, :today?, to: :day

    def initialize(kid, day, chores, daily_chores)
      @kid = kid
      @day = day
      @chores = chores
      @daily_chores = daily_chores
    end

    def pay?
      @pay ||= satisfied? && !future?
    end

    def satisfied?
      @satisfied ||= begin
        return true if before_kid?
        return true if day.future?

        chores.all? { chore_ids.include?(_1.id) }
      end
    end

    def before_kid?
      day < kid.created_at.to_date
    end

    private

    def chore_ids
      @chore_ids ||= daily_chores.map(&:chore_id)
    end
  end
end
