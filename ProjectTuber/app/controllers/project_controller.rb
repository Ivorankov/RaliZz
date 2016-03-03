class ProjectController < ApplicationController
  #require ProjectHelper
  skip_before_action :verify_authenticity_token
  ERROR_MESSAGE = 'Invalid input {Title: min => 3 max => 30,
                       Description: min => 10 max => 500,
                       Link: max=>1000}'
  SUCCESS_MESSAGE = 'You did it!'

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def add #TODO Define global constants for these
    case request.method_symbol
      when :get

      when :post
        title = params[:title]
        description = params[:description]
        link_to_source = params[:link_to_source]
        ##is_link_valid = link_to_source.present?

        if true
          Project.create(:title => title,
                         :description => description,
                         :link_to_source => link_to_source)
          flash[:success] = SUCCESS_MESSAGE
        else
          flash[:alert] = ERROR_MESSAGE
        end
      else
        redirect_to project_path
    end
  end

  def update
  end

  def delete
  end
end
