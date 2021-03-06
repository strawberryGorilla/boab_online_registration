require 'spec_helper.rb'

feature "Deleting trips" do
	before do
    	sign_in_as!(FactoryGirl.create(:admin_user))
  	end
	scenario "Deleting a project" do
		FactoryGirl.create(:trip, name: "Panama City Beach")

		visit "/"
		click_link "Panama City Beach"
		click_link "Delete Trip"

		expect(page).to have_content("Trip has been deleted.")

		visit "/"

		expect(page).to have_no_content("Panama City Beach")
	end
end