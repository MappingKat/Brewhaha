# Read about factories at https://github.com/thoughtbot/factory_girl
# require 'faker'

FactoryGirl.define do
  factory :order do |f|
    f.status "in process"
    f.customer_id 8
  end
end
