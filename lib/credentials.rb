class Credentials

  ACCOUNT_SID = '<your Twilio account SID>'
  AUTH_TOKEN = '<your Twilio authentication token'
  SENDER_NUMBER = '<your Twilio phone number>'

  def acc_sid
    ACCOUNT_SID
  end

  def auth_token
    AUTH_TOKEN
  end

  def sender
    SENDER_NUMBER
  end
end
