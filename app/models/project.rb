class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def find_theme
    Challenge.where(id: challenge_id).first.theme
  end

  def count_contestants
    contestants.size
  end

end