require 'spec_helper'

describe Category do
  let(:category) { Category.new(
                  name:        "wine",
                  description: "a beautiful taste of grapes that will taste good in your mouth",
                  sort_order:  5 )
              }

  context "when given all correct parameters" do
    it "should be valid" do
      expect(category).to be_valid
    end
  end
    
  context "when it does not have a name" do 
    it "should be invalid" do
     category.name = nil
      expect(category).to be_invalid 
    end
  end

  context "when it does not have a description" do 
    it "should be invalid" do
      category.description = nil
      expect(category).not_to be_valid 
    end
  end
end
