require 'httparty'

class UsersController < ApplicationController
  def index
  end

  def create
    email = user_params[:email]
    password = user_params[:password]

    base_url = 'http://localhost:3000'

    res = HTTParty.post(base_url+'/auth/sign_in',
                        query: {email: 'test3@test.com', password: 'password'})

    res_headers = res.headers
    #request_headers = { access_token: res_headers['access-token'],
    #                      token_type: res_headers['token-type'],
    #                          expiry: res_headers['expiry'],
    #                          client: res_headers['client'],
    #                             uid: res_headers['uid'] }

    cookies.encrypted['access-token'] = res_headers['access-token']
    cookies.encrypted['token-type']   = res_headers['token-type']
    cookies.encrypted['expiry']       = res_headers['expiry']
    cookies.encrypted['client']       = res_headers['client']
    cookies.encrypted['uid']          = res_headers['uid']

    #response.set_header("access_token", res_headers['access_token'])
    #response.set_header("token_type", res_headers['token-type'])
    #response.set_header("expiry", res_headers['expiry'])
    #response.set_header("client", res_headers['client'])
    #response.set_header("uid", res_headers['uid'])

    #res = HTTParty.get(base_url+'/posts',
    #            headers: request_headers)

    render 'lihp'
  end


  private
  def user_params
    params.permit(:email, :password)
  end

end
