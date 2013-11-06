require 'spec_helper'

describe Customer do
  let(:customer) { Customer.new(
    first_name:   "Randy",
    last_name:    "Goodhue",
    email:        "rgoodhue@gmail.com",
    display_name: "rgoodhue",
    password:     "deadly99",
    admin:        false )
    }

  context "when given all correct parameters" do
    it "should be valid" do
      expect(customer).to be_valid
    end
  end
    
  context "when it does not have a first name" do 
    it "should be invalid" do
      customer.first_name = nil
      expect(customer).to be_invalid 
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
      expect(customer).not_to be_valid 
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

  context "when it does not have an password" do
    it "should be invalid" do
      customer.password = nil
      expect(customer).not_to be_valid 
    end
  end

  context "should have error on password" do
    it "should be invalid" do
      customer.password = "8"
      expect(customer).not_to be_valid
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
      customer.email = "83203439q84%33dfasfasfdsa"
      expect(customer).to be_invalid
    end
  end

  context "should have error on email" do
    it "shoud be invalid" do
      customer.email = "8@8/.com"
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
    let(:customer2) { Customer.create(
    first_name:   "Randy",
    last_name:    "Goodhue",
    display_name: "rgoodhue",
    password:     "deadly",
    email:        "rgoodhue@gmail.com",
    admin:        false
    )
      }

    it "should be invalid" do
      customer.save
      expect(customer2).to be_invalid
    end
  end
end
