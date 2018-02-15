module Submission
  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
    url = "#{api_url}/checkpoint_submissions"
    headers = {
      "authorization" => @auth_token
    }
    body = {
      "assignment_branch": assignment_branch,
      "assignment_commit_link": assignment_commit_link,
      "checkpoint_id": checkpoint_id,
      "comment": comment,
      "enrollment_id": @me_hash["current_enrollment"]["id"],
    }
    response = self.class.post(url, body: body, headers: headers)
  end

  def update_submission(id, checkpoint_id, assignment_branch, assignment_commit_link, comment)
    url = "#{api_url}/checkpoint_submissions/#{id}"
    headers = {
      "authorization" => @auth_token
    }
    body = {
      "assignment_branch": assignment_branch,
      "assignment_commit_link": assignment_commit_link,
      "checkpoint_id": checkpoint_id,
      "comment": comment,
      "enrollment_id": @me_hash["current_enrollment"]["id"],
    }
    response = self.class.put(url, body: body, headers: headers)
  end
end
