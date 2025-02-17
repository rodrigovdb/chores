# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kids/edit' do
  let(:user) { create(:user) }
  let(:kid) do
    Kid.create!(
      user:,
      name: 'MyString'
    )
  end

  before do
    assign(:kid, kid)
    assign(:chores, build_stubbed_list(:chore, 2, user:))
  end

  xit 'renders the edit kid form' do
    render

    assert_select 'form[action=?][method=?]', kid_path(kid), 'post' do
      assert_select 'input[name=?]', 'kid[user_id]'

      assert_select 'input[name=?]', 'kid[name]'
    end
  end
end
