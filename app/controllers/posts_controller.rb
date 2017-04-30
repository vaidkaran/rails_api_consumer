require 'httparty'

class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    puts 'test string'
    req_headers = {}
    req_headers['access-token'] = cookies.encrypted['access-token']
    req_headers['token-type']   = cookies.encrypted['token-type']
    req_headers['expiry']       = cookies.encrypted['expiry']
    req_headers['client']       = cookies.encrypted['client']
    req_headers['uid']          = cookies.encrypted['uid']

    @res = HTTParty.get(service_base_url+'/posts',
           headers: req_headers)
  end

end
