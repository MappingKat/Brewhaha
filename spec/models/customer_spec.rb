require 'spec_helper'

describe Customer do
  let(:customer) { Customer.new(
    first_name:   "Randy",
    last_name:    "Goodhue",
    display_name: "rgoodhue",
    email:        "rgoodhue@gmail.com",
    admin:        ""
    )
  }

  context "when given all correct parameters" do
    it "should be valid" do
      expect(customer).to be_valid
    end
  end
    
  context "when it does not have a first name" do 
    it "should be invalid" do
      customer.first_name = nil
      expect(first_name).to be_invalid 
    end
  end

  context "should have error on first name" do  
    it "should be invalid" do
      customer.first_name =  "r"
      expect(customer).to be_invalid
    end
  end

  context "when it does not have a last name" do 
    it "should be invalid" do
      customer.last_name = nil
      expect(first_name).to be_invalid 
    end
  end

  context "should have error on last name" do  
    it "should be invalid" do
      customer.last_name =  "Goodhuehellllllllllllllllllllllloo"
      expect(customer).to be_invalid
    end
  end

  context "should have error on display name" do  
    it "should be invalid" do
      customer.display_name = "sexymammmmmmmmmmmmmmmmaaaaaaaaaaaaa"
      expect(customer).to be_invalid
    end
  end

  context "when it does not have an email" do
    it "should be invalid" do
      customer.email = nil
      expect(customer).to be_invalid
    end
  end

  context "should have error on email" do
    it "should be invalid" do
      customer.email = "83203439q84%33"
      expect(customer).to be_invalid
    end
  end

  context "should have error on email" do
    it "shoud be invalid" do
      customer.email = "8@8.com"
      expect(customer).to be_invalid
    end
  end

  context "when it does not have admin" do
    it "should be false" do
      customer.admin = nil
      expect(customer).to be_valid
    end
  end

  context "when creating a product with the same name" do
    let (:customer2) {Customer.create(
    first_name:   "Randy",
    last_name:    "Goodhue",
    display_name: "rgoodhue",
    email:        "rgoodhue@gmail.com",
    admin:        "",
    )
      }

    it "should be invalid" do
      customer.save
      expect(customer2).to be_invalid
    end

    it "should have an error in name" do
      customer.save
      expect(customer2).to have(1).error_on(:name)
    end
  end
end
