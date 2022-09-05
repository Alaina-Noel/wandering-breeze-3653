require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "#instance_methods" do
    it 'should find the theme of the project to whom it belongs' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      expect(news_chic.find_theme).to eq("Recycled Material")
      expect(upholstery_tux.find_theme).to eq("Apartment Furnishings")
    end
  end
end