class ContestantsController < ApplicationController

  def index
    @contestants = Contestant.find_all_contestants
    @contestant_projects = Contestant.find_all_projects
  end

end