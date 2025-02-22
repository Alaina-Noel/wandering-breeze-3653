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

      it 'I see a count of the number of contestants on this project' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        
        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
        
        upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
        lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
        
        jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        kentaro = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
        erin = Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
        
        ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id)
        ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id)
        ContestantProject.create!(contestant_id: kentaro.id, project_id: news_chic.id)
        ContestantProject.create!(contestant_id: kentaro.id, project_id: boardfit.id)
        ContestantProject.create!(contestant_id: erin.id, project_id: boardfit.id) 
        
        visit "/projects/#{news_chic.id}"
        expect(page).to have_content("Number of Contestants:")
        expect(page).to have_content(3)

        visit "/projects/#{boardfit.id}"

        expect(page).to have_content("Number of Contestants:")
        expect(page).to have_content(2)

      end
    end
  end
end