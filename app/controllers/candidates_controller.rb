class CandidatesController < ApplicationController
  def index
  end

  def new
    # @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to @candidate
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
