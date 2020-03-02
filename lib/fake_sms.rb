class FakeSms

  def send_sms phone_number, message
    "#{message} was sent to #{phone_number}"
  end
end
