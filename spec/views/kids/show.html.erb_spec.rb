# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kids/show' do
  let(:user) { create(:user) }
  let(:kid) { create(:kid, user:) }
  let(:streak) { StreakService.call(kid:) }
  let(:week) { Week.new(kid:) }

  before do
    assign(:kid, kid)
    assign(:streak, streak)
    assign(:week, week)
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
