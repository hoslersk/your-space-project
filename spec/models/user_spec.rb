require 'rails_helper'

describe User do
  user1 = FactoryGirl.create(:user)

  it 'has a name' do
    binding.pry
    expect(katie.first_name).to eq("Katie")
  end



end
