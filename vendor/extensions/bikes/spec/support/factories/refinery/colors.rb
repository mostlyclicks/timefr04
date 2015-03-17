
FactoryGirl.define do
  factory :color, :class => Refinery::Bikes::Color do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

