FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    email "user@user.com"
    name "user"
    password "12345678"
    role 2
  end
end
