require 'spec_helper'

describe "categories/edit" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :available => false,
      :name => "MyString",
      :description => "MyText",
      :sort_order => 1
    ))
  end

  it "renders the edit category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", category_path(@category), "post" do
      assert_select "input#category_available[name=?]", "category[available]"
      assert_select "input#category_name[name=?]", "category[name]"
      assert_select "textarea#category_description[name=?]", "category[description]"
      assert_select "input#category_sort_order[name=?]", "category[sort_order]"
    end
  end
end
