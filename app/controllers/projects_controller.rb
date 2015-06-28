class ProjectsController < ApplicationController
  def workspace
    @project = Project.first
  end
end
