class Admin::SectionsController < ApplicationController
  def new
    @candidate = Candidate.find(params[:candidate_id])
    @section = Section.new
  end

  def create
    @candidate = Candidate.find(params[:candidate_id])
    @section = @candidate.sections.create(section_params)
    redirect_to admin_candidate_path(@candidate)
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end
end
