# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kids/index' do
  before do
    user = create(:user)
    assign(:kids, [
             Kid.create!(
               user:,
               name: 'Name 1'
             ),
             Kid.create!(
               user:,
               name: 'Name 2'
             )
           ])
  end

  it 'renders a list of kids' do
    render
    cell_selector = 'li.list-group-item'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
