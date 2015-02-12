class S3Controller < ApplicationController
  
  after_action :allow_iframe

  def new
    s3data = S3_BUCKET.presigned_post(
      key: "uploads/#{SecureRandom.uuid}/${filename}",
      success_action_status: 201,
      acl: :public_read
    )
    render json: { fields: s3data.fields, url: s3data.url }
  end

  private
    
    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end
end
