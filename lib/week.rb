class Week
  def initialize(kid:, date: nil)
    date ||= Date.current

    @week = date.is_a?(Range) ? date : date.all_week
    @kid = kid
  end

  def begin
    week.first
  end

  def end
    week.last
  end

  def previous
    self.class.new(date: self.begin - 1.week)
  end

  def next
    self.class.new(date: self.begin + 1.week)
  end

  def satisfied?
    week.each do |day|
      break if day.future?

      chores.each do |chore|
        return false unless daily_chores.for_day(day).map(&:chore_id).include?(chore.id)
      end
    end

    true
  end

  private

  attr_reader :week, :kid

  def chores
    @chores ||= kid.chores
  end

  def daily_chores
    @daily_chores ||= kid.daily_chores.for_week(week)
  end
end
