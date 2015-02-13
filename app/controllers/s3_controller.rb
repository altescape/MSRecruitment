class S3Controller < ApplicationController
  
  after_action :allow_iframe

  def new
    random_id = SecureRandom.uuid
    s3data = S3_BUCKET.presigned_post(
      key: "uploads/#{random_id}/${filename}",
      success_action_status: 201,
      acl: :public_read
    )
    render json: { fields: s3data.fields, url: s3data.url, directory: random_id }
  end

  private
    
    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end
end
