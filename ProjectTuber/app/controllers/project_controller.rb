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

        is_title_valid = validate_length(title, 3, 30)
        is_description_valid = validate_length(description, 10, 500)
        is_link_valid = validate_length(link_to_source, 0, 1000)

        if is_link_valid & is_description_valid & is_title_valid
          Project.create(:title => title,
                         :description => description,
                         :link_to_source => link_to_source)
          flash[:success] = SUCCESS_MESSAGE
          redirect_to '/project/index'
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

  private
  def validate_length(string_variable, min, max)
    length = string_variable.length
    is_valid_length =  length > min && length < max
  end
end
