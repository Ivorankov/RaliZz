class ProjectController < ApplicationController
  #require ProjectHelper
  skip_before_action :verify_authenticity_token
  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def add #TODO Define global constants for these
    title = params[:title]
    is_title_valid =  title.present?
    description = params[:description]
    is_description_valid = description.present?
    link_to_source = params[:link_to_source]
    is_link_valid = link_to_source.present?

    if is_title_valid && is_description_valid && is_link_valid
      Project.create(:title => title,
                     :description => description,
                     :link_to_source => link_to_source)
    else
      flash[:alert] = 'Invalid input data'

    end

  end

  def update
  end

  def delete
  end
end
