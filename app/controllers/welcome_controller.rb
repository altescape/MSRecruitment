class WelcomeController < ApplicationController
  
  after_action :allow_iframe
  
  def index

  end

  def thankyou
    render 'thankyou'
  end

  private

    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end
end
