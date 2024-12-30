# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kids/show' do
  before do
    assign(:kid, Kid.create!(
                   user: nil,
                   name: 'Name'
                 ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
