# frozen_string_literal: true

class StreakService < ApplicationService
  def initialize(kid:)
    @kid = kid
    @weeks = 0
  end

  def call
    {
      days:,
      first_day:,
      weeks_in_a_row: @weeks
    }
  end

  private

  attr_reader :kid

  delegate :created_at, to: :kid

  def days
    response = (Date.current - first_day).to_i

    today.satisfied? ? response + 1 : response
  end

  def first_day
    @first_day ||= find_first_day
  end

  def current_week
    @current_week ||= Week.new(kid:)
  end

  def today
    @today ||= current_week.days.find { |week_day| week_day.day.today? }
  end

  def find_first_day(week = nil)
    week ||= current_week

    if week.before_kid? || !week.satisfied? || week.previous.end < kid.created_at
      return week.days.find { |week_day| !week_day.before_kid? && week_day.satisfied? }.day
    end

    @weeks += 1
    find_first_day(week.previous)
  end
end
