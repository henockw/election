class Admin::CandidatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = current_user.candidates.create(candidate_params)
    if @candidate.valid?
      redirect_to admin_candidate_path(@candidate)
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  private

  def candidate_params
    params.require(:candidaate).permit(:title, :description)
  end
end
