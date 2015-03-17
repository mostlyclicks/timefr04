
FactoryGirl.define do
  factory :feature, :class => Refinery::Bikes::Feature do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

