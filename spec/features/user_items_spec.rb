require 'spec_helper'

describe 'item list' do
  it 'displays a list of items' do
    visit '/items'
    page.should have_content('beer')
  end
end
