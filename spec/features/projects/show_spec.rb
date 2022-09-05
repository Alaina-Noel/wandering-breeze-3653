require 'rails_helper'

RSpec.describe 'the projects show page', type: :feature do 
  describe "As a user" do
    describe "When I visit /projects/:id" do
        it 'I see that projects name, material, & the theme of the challenge that this project belongs' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        visit "/customers/#{customer.id}/edit"

        expect(page).to have_content("In USA?")
      end
    end
  end
end

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)