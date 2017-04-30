class WelcomeController < ApplicationController
  def index
    if valid_token
      redirect_to users_url
    end
  end
end
