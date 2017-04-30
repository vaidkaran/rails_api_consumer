require 'httparty'

class UsersController < ApplicationController
  before_action :authenticate_user, only: :index

  def index
  end

  def create
    email = user_params[:email]
    password = user_params[:password]
    res = HTTParty.post(service_base_url+'/auth/sign_in',
                        query: {email: email, password: password})
    res_headers = res.headers

    cookies.encrypted['access-token'] = res_headers['access-token']
    cookies.encrypted['token-type']   = res_headers['token-type']
    cookies.encrypted['expiry']       = res_headers['expiry']
    cookies.encrypted['client']       = res_headers['client']
    cookies.encrypted['uid']          = res_headers['uid']

    render 'index'
  end

  def sign_out
    if valid_token
      cookies.delete 'access-token'
      cookies.delete 'token-type'
      cookies.delete 'expiry'
      cookies.delete 'uid'
      cookies.delete 'client'

      render 'welcome/index'
    else
      render 'users/index'
    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end

end
