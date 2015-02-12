class CandidatesController < ApplicationController
  def index
    @candidate = Candidate.new
    render 'new'
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      CandidateMailer.welcome_email(@candidate).deliver
      CandidateMailer.notification_email(@candidate).deliver
      render "welcome/thankyou" 
    else
      render 'new'
    end
  end

  def show
    # @candidate = Candidate.find(params[:id])
    @candidate = Candidate.new
    render 'new'
  end

  private
    def candidate_params
      params.require(:candidate).permit(:name, :gender, :experience, :position, :area, :email, :phone, :resume)
    end
end
