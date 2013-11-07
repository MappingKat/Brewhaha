# require 'faker'

FactoryGirl.define do
  factory :item do |f|
    f.name "Man Beer"
    f.description "A manly beer for manly men."
    f.price 500
    f.cost 200
    f.sort_order 10
  end
end
