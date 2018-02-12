require "httparty"
require "json"

class Kele
  include HTTParty

  def initialize(email, password)
    @api_url = "https://www.bloc.io/api/v1/sessions"
    body = {
      email: email,
      password: password
    }
    response = self.class.post(@api_url, body: body)
    raise 'Invalid email or password.' if response.code != 200
    @auth_token = response['auth_token']
  end

  def get_me
    url = 'https://www.bloc.io/api/v1/users/me'
    headers = {
      "authorization" => @auth_token
    }
    response = self.class.get(url, headers: headers)
    @me_hash = JSON.parse(response.body)
  end
end
