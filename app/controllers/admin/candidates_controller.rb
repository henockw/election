class Admin::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_candidate, only: [:show]

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
    
  end


  private

  def require_authorized_for_current_candidate
    if current_candidate.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_candidate
  def current_candidate
    @current_candidate ||= Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :description)
  end
end
