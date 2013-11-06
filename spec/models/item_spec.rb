require 'spec_helper'

describe Item do
  it "has a valid factory" do
    FactoryGirl.create(:item).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:item, name: nil).should_not be_valid
  end
  it "is invalid without a price"
  it "is invalid without a cost"
  # pending "add some examples to (or delete) #{__FILE__}"
end
