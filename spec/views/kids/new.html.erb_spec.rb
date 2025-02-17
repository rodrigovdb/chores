# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kids/new' do
  before do
    assign(:kid, Kid.new(
                   user: nil,
                   name: 'MyString'
                 ))
  end

  xit 'renders new kid form' do
    render

    assert_select 'form[action=?][method=?]', kids_path, 'post' do
      assert_select 'input[name=?]', 'kid[user_id]'

      assert_select 'input[name=?]', 'kid[name]'
    end
  end
end
