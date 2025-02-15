# frozen_string_literal: true

RSpec.describe StreakService do
  subject(:service) { described_class.new(kid:) }

  let(:created_at) { Date.new(2024, 12, 23) }
  let(:today) { Date.new(2025, 1, 4) }
  let(:start_date) { Date.new(2025, 1, 1) }
  let(:end_date) { today }

  let(:user) { create(:user) }
  let(:kid) { create(:kid, user:, created_at:, chores: build_list(:chore, 2)) }
  let(:chores) { kid.chores }

  shared_context 'with daily chores' do
    before do
      Timecop.freeze(today.to_time + 6.hours + 15.minutes)

      (created_at..end_date).each do |day|
        chores.first.daily_chores << DailyChore.new(kid:, created_at: day + 6.hours)
      end

      (start_date..today).each do |day|
        chores.last.daily_chores << DailyChore.new(kid:, created_at: day + 6.hours)
      end
    end
  end

  describe '#call' do
    subject { service.call }

    context 'when today is satisfied' do
      include_context 'with daily chores'

      it do
        expect(subject).to eq(
          days: 4,
          first_day: Date.new(2025, 1, 1),
          weeks_in_a_row: 0
        )
      end
    end

    context 'when today is not satisfied yet' do
      let(:end_date) { today.yesterday }

      include_context 'with daily chores'

      it do
        expect(subject).to eq(
          days: 3,
          first_day: Date.new(2025, 1, 1),
          weeks_in_a_row: 0
        )
      end
    end

    context 'when the first day is in a previous week' do
      let(:created_at) { Date.new(2024, 12, 24) } # tuesday, previous week
      let(:start_date) { created_at }

      include_context 'with daily chores'

      it do
        expect(subject).to eq(
          days: 12,
          first_day: created_at,
          weeks_in_a_row: 1
        )
      end
    end

    context 'when the first day is on the beginning of the week' do
      let(:created_at) { Date.new(2024, 12, 30) } # monday, this week
      let(:start_date) { created_at }

      include_context 'with daily chores'

      it do
        expect(subject).to eq(
          days: 6,
          first_day: created_at,
          weeks_in_a_row: 0
        )
      end
    end
  end
end
