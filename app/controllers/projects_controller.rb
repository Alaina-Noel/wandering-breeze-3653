class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @project_theme_challenge = @project.find_theme
  end

end