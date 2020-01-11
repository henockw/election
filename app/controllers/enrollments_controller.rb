class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.enrollments.create(candidate: current_candidate)
    redirect_to candidate_path(current_candidate)
  end

  private

  def current_candidate
    @current_candidate ||= Candidate.find(params[:candidate_id])
  end
end
