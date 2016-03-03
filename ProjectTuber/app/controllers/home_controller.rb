class HomeController < ApplicationController
  def index
    @projects_count = Project.all.length
  end
end
