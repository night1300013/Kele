require "httparty"
require "json"
require_relative "roadmap"

class Kele
  include HTTParty
  include Roadmap

  def initialize(email, password)
    url = api_url + "sessions"
    body = {
      email: email,
      password: password
    }
    response = self.class.post(url, body: body)
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

  def get_mentor_availability(mentor_id)
    url = api_url + "mentors/#{mentor_id}/student_availability"
    headers = {
      "authorization" => @auth_token
    }
    response = self.class.get(url, headers: headers)
    @mentor_availability = JSON.parse(response.body)
  end

  private
  def api_url
    "https://www.bloc.io/api/v1/"
  end
end
