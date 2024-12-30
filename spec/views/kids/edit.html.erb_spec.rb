# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kids/edit' do
  let(:kid) do
    Kid.create!(
      user: nil,
      name: 'MyString'
    )
  end

  before do
    assign(:kid, kid)
  end

  it 'renders the edit kid form' do
    render

    assert_select 'form[action=?][method=?]', kid_path(kid), 'post' do
      assert_select 'input[name=?]', 'kid[user_id]'

      assert_select 'input[name=?]', 'kid[name]'
    end
  end
end
