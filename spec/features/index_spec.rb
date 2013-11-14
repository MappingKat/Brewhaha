require 'spec_helper'

describe "home page", :type => :feature do

  it "lists a single category" do
    visit root_path
    click_on("Cider")
    within('body') { expect(page).to have_content('Grasshop-ah')}
  end

  # it "allows user to log in via twitter" do
  #   visit root_path
  #   click_on('Login with Twitter')
  #   within('body') { expect(page).to have_content('Authorize Brewhaha')}
  # end

  it "adds item to cart" do
    visit root_path
    click_on("add_button_9")
    within(".cart") { expect(page).to have_content('Sonoma')}
  end

end

