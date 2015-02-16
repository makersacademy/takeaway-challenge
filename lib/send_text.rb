module Send_text

def send_text
  time = Time.new
  time1hr = time + 3600
  puts "Thank you! Your order was placed and will be delivered before #{time1hr.strftime("%I:%M%p")}."
  account_id
  message
end

def account_id
  account_sid = 'AC60c54cda75e5c928759e85292d5cd749'
  auth_token = 'b6f9be75ac109b8aad8db70d3679272e'
  @client = Twilio::REST::Client.new account_sid, auth_token
end

def message
  message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{time1hr.strftime("%I:%M%p")}.",
    :to => "+447982998227",  
    :from => "+441618505718")  
  puts message.sid
end

end