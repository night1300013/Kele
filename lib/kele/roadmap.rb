module Roadmap
  def get_roadmap(roadmap_id)
    url = "#{api_url}/roadmaps/#{roadmap_id}"
    headers = {
      "authorization" => @auth_token
    }
    response = self.class.get(url, headers: headers)
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    url = "#{api_url}/checkpoints/#{checkpoint_id}"
    headers = {
      "authorization" => @auth_token
    }
    response = self.class.get(url, headers: headers)
    JSON.parse(response.body)
  end
end
