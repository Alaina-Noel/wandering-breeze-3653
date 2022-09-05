class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def self.find_all_contestants
    all
  end

  def find_all_projects
    require 'pry' ; binding.pry
  end
  
end