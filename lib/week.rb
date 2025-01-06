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

  def chores
    @chores ||= kid.chores
  end

  def future?
    self.begin.future?
  end

  def before_kid?
    @before_kid ||= days.any?(&:before_kid?)
  end

  def include_kid?
    @include_kid ||= self.end < kid.created_at
  end

  def satisfied?
    @satisfied ||= days.all?(&:satisfied?)
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

    def satisfied?
      @satisfied ||= begin
        return true if before_kid?
        return true if day.future?

        chores.all? { chore_ids.include?(_1.id) }
      end
    end

    def before_kid?
      day < kid.created_at
    end

    private

    def chore_ids
      @chore_ids ||= daily_chores.map(&:chore_id)
    end
  end
end
