require 'rails_helper'

RSpec.describe 'the projects show page', type: :feature do 
  describe "As a user" do
    describe "When I visit /projects/:id" do
        it 'I see that projects name, material, & the theme of the challenge of which this project belongs' do
          recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
          news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

          visit "/projects/#{news_chic.id}"

          expect(page).to have_content("News Chic")
          expect(page).to have_content("Material:")
          expect(page).to have_content("Challenge Theme:")
          expect(page).to have_content("Newspaper")
          expect(page).to have_content("Recycled Material")
      end
    end
  end
end