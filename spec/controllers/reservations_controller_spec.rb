require 'rails_helper'

RSpec.describe ReservationsController, :type => :controller do

  let!(:uneek) { User.create(username: "uneek", first_name: "Uneek", last_name: "Smith", email: "uneek.smith@gmail.com", password: "password") }
  let!(:usneek) { User.create(username: "usneek", first_name: "Usneek", last_name: "Jones", email: "usneek.jones@gmail.com", password: "password") }
  let!(:junkyard) { Venue.create(name: "Junkyard", host_id: uneek.id, address: "123 Street", city: "J-town", zip_code: "34215", description: "garbage") }

  let!(:j_listing) { Listing.create(venue_id: junkyard.id, available_start_date: "2026-01-01", available_end_date: "2026-02-01", price: 100.00) }
  let(:j_res) { Reservation.create(listing_id: j_listing.id, renter_id: usneek.id, start_date: "2026-01-05", end_date: "2026-01-07", confirmed: false) }

  # before(:each) do
  #
  # end

  describe "#destroy" do

    before(:each) do
      @res = j_res
      allow(controller).to receive(:logged_in?).and_return(true)
      allow(controller).to receive(:current_user).and_return(@res.host)
    end

    it "cancels (destroys) a reservation" do

      expect do
        binding.pry
        delete :destroy, :id => @res

      end.to change {Reservation.count}.from(1).to(0)
    end
  end


end

# RSpec.describe RepositoriesController, :type => :controller do
#
#   let(:user) { User.create(name: "Sophie DeBenedetto", email: "sophie.debenedetto@gmail.com", github_username: "sophiedebenedetto") }
#
#    before(:each) do
#     allow(controller).to receive(:logged_in?).and_return(true)
#     allow(controller).to receive(:current_user).and_return(user)
#    end
#   describe "#create" do
#     it "creates a repo with the given link and information requested from github" do
#       VCR.use_cassette("create_repo") do
#         expect do
#           post :create, {repository: {url: "https://github.com/sophiedebenedetto/learn-write"}}
#         end.to change {Repository.count}.from(0).to(1)
#         repo = Repository.first
#         expect(repo.url).to eq("https://github.com/sophiedebenedetto/learn-write")
#         expect(repo.name).to eq("learn-write")
#       end
#     end
#
#     it "creates the correct number of issues and associates them to the new repository" do
#       VCR.use_cassette("create_repo") do
#          post :create, {repository: {url: "https://github.com/sophiedebenedetto/learn-write"}}
#          repo = Repository.first
#          expect(repo.issues.count).to eq(2)
#          expect(Issue.first.repository).to eq(repo)
#          expect(Issue.second.repository).to eq(repo)
#        end
#     end
#   end
# end
