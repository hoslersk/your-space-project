FactoryGirl.define do
  factory :venue do
    name {Faker::Name.last_name}
    address {Faker::Address.street_address}
    description "blahhh"
    city {Faker::Address.city}
    zip_code {Faker::Address.zip_code}
  end
end
###### DOES ANYONE HAVE EXAMPLES???
