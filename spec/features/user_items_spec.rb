require 'spec_helper'

describe 'item list' do
  it 'displays a list of items' do
    Item.new(description: "This manly Beer is for manly men.", price: 500, cost: 200).save
    visit '/items'
    page.should have_content('Cost')
  end
end
