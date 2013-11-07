require 'spec_helper'

describe Order do
  it "has a valid factory" do
    order = FactoryGirl.create(:order).
    should be_valid
  end

  context "when it does not have customer_id"
    it "is invalid without a customer" do
    FactoryGirl.build(:order, customer_id: nil).should_not be_valid
  end

  context "when it does not have a status"
    it "is invalid without a status" do
    FactoryGirl.build(:order, status: nil).should_not be_valid
  end
end
