require 'spec_helper'

describe Item do
  it "has a valid factory" do
    FactoryGirl.create(:item).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:item, name: nil).should_not be_valid
  end
  it "is invalid without a price" do
    FactoryGirl.build(:item, price: nil).should_not be_valid
  end
  it "is invalid without a cost" do
    FactoryGirl.build(:item, cost: nil).should_not be_valid
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
