require 'httparty'
class PostsController < ApplicationController
  def index
    require 'pry'; binding.pry
    base_url = 'http://localhost:3000'
    puts 'test string'
    res_headers = {}
    res_headers['access-token'] = cookies.encrypted['access-token']
    res_headers['token-type'] = cookies.encrypted['token-type']
    res_headers['expiry'] = cookies.encrypted['expiry']
    res_headers['client'] = cookies.encrypted['client']
    res_headers['uid'] = cookies.encrypted['uid']

    res = HTTParty.get(base_url+'/posts',
                headers: request_headers)
  end

end
