# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    display_name "MyString"
    password "MyString"
    latlong 1
    admin false
  end
end
