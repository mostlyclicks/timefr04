
FactoryGirl.define do
  factory :group, :class => Refinery::Groups::Group do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

