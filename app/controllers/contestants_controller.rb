class ContestantsController < ApplicationController

  def index
    @contestants = Contestant.find_all_contestants
  end

end