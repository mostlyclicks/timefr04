
FactoryGirl.define do
  factory :bike, :class => Refinery::Bikes::Bike do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

