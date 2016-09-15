FactoryGirl.define do
  factory :listing do
    venue_id
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    username {Faker::Internet.user_name}
    password "password"
  end

end
