class ProjectController < ApplicationController
  #require ProjectHelper
  skip_before_action :verify_authenticity_token
  ERROR_MESSAGE = 'Invalid input {Title: min => 3 max => 30,
                       Description: min => 10 max => 500,
                       Link: max=>1000}'
  SUCCESS_MESSAGE = 'You did it!'

  def index
    response.headers["X-FRAME-OPTIONS"] = 'SAMEORIGIN'
    @projects = Project.order(created_at: :desc).paginate(:page => params[:page])
    @images = Image.all.take(2)
  end

  def add #TODO Define global constants for these
    case request.method_symbol
      when :get

      when :post
        title = params[:title]
        description = params[:description]
        link_to_source = params[:link_to_source]
        link_to_video = params[:link_to_video]

        is_title_valid = validate_length(title, 3, 30)
        is_description_valid = validate_length(description, 10, 500)
        is_link_valid = validate_length(link_to_source, 0, 1000)
        is_video_valid = validate_length(link_to_video, 0, 1000)
        youtube_video_id = link_to_video.rindex('=')
        youtube_modified_video_link = "http://www.youtube.com/embed/" + link_to_video[youtube_video_id + 1..-1]
        if is_link_valid && is_description_valid && is_title_valid && is_video_valid
          Project.create(:title => title,
                         :description => description,
                         :link_to_source => link_to_source,
                         :link_to_video => youtube_modified_video_link) do |p|
            p.save
            save(params[:image], params[:title], p)
          end
          flash[:success] = SUCCESS_MESSAGE
          redirect_to '/project/index'
        else
          flash[:alert] = ERROR_MESSAGE
        end
      else
        redirect_to project_path
    end
  end

  def manage
    case request.method_symbol
      when :get
        @projects = Project.paginate(:page => params[:page])
      when :post
        project_id = params[:id]
        project = Project.find(project_id)
        path = 'public/images/projects/' + project.title
        project.delete
        FileUtils.rm_rf(path)
      else
        redirect_to project_path
    end

  end

  def delete
  end

  private
  def validate_length(string_variable, min, max)
    length = string_variable.length
    is_valid_length = length >= min && length <= max
  end

  def save(upload, project_name, project)
    name = upload['image'].original_filename
    directory = "public/images/projects/" + project_name
    # create the file path
    FileUtils::mkdir_p directory
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['image'].read) }
    path.slice!(0, 6)
    project.images.create(:name => name, :file_path => path)
  end
end
