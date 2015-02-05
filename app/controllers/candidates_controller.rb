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
      #redirect_to @candidate
      render "welcome/thankyou" 
    else
      render 'new'
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  private
    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :phone, :position, :resume)
    end
end
