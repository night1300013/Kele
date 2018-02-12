require "httparty"

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
end
