module Message
  def get_messages(page = "1")
    url = "#{api_url}/message_threads"
    headers = {
      "authorization" => @auth_token
    }
    unless is_int?(page)
      page = "1"
    end

    body = {
      "page": page,
    }
    response = self.class.get(url, body: body, headers: headers)
    JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, stripped_text)
    url = "#{api_url}/messages"
    headers = {
      "authorization" => @auth_token
    }
    body = {
      :sender => sender,
      :recipient_id => recipient_id,
      :subject => subject,#"Royale with cheese",
      "stripped-text": stripped_text,#"That's what they call a quarter pounder in France."
    }
    response = self.class.post(url, body: body, headers: headers)
  end

  private

  def is_int?(page)
    page =~ /^[0-9]*$/
  end
end
