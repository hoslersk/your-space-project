FactoryGirl.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    username {Faker::Internet.user_name}
    password "password"
    after(:create) do |user|
      create_list(:venue, 3, host_id: user.id)
    end
  end
end
