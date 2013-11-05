require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :available => false,
      :name => "MyString",
      :description => "MyText",
      :price => 1,
      :cost => 1,
      :category => nil,
      :sort_order => 1
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_available[name=?]", "item[available]"
      assert_select "input#item_name[name=?]", "item[name]"
      assert_select "textarea#item_description[name=?]", "item[description]"
      assert_select "input#item_price[name=?]", "item[price]"
      assert_select "input#item_cost[name=?]", "item[cost]"
      assert_select "input#item_category[name=?]", "item[category]"
      assert_select "input#item_sort_order[name=?]", "item[sort_order]"
    end
  end
end
