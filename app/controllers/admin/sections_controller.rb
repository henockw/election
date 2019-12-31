class Admin::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_candidate
  
  def new
    @section = Section.new
  end

  def create
    @section = current_candidate.sections.create(section_params)
    redirect_to admin_candidate_path(current_candidate)
  end

  private

  def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_candidate
  def current_candidate
    @current_candidate ||= Course.find(params[:candidate_id])
  end

  def section_params
    params.require(:section).permit(:title)
  end
end
