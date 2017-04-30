module ApplicationHelper
  def service_base_url
    'http://localhost:3000'
  end

  def valid_token
    res = HTTParty.get(service_base_url+'/auth/validate_token',
                       query: {'access-token': cookies.encrypted['access-token'],
                               uid: cookies.encrypted['uid'],
                               client: cookies.encrypted['client']})
    res['success']
  end

  def authenticate_user
    if !valid_token
      render 'welcome/index'
    end
  end

end
