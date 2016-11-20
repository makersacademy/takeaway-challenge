require 'twilio-ruby'

class TakeAway

  attr_reader :new_order

  def initialize
    @new_order = []
  end

  def view_menu
  {"chicken carbonara" => 10,
        "tandoori chicken" => 12,
        "peri peri chicken" => 12,
        "garlic prawn" => 14,
        "pepperoni" => 12,
        "cheese" => 5}
  end

  def order(selected_dish)
    fail "Selection not available" if view_menu[selected_dish] == nil
    @new_order << selected_dish

  end

  def check_total
    @new_order.map {|dish| view_menu[dish]}.inject {|sum,n| sum + n}
  end


end

# account_sid = 'AC412d6784672fa15916722dda103c1c74'
# auth_token = '5357348101e9396095b3927d5095954b'
#
# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.account.messages.create(:body => "Hello from Ruby",
#     :to => "+447816222149",    # Replace with your phone number
#     :from => "+447816222149")  # Replace with your Twilio number
#
# puts message.sid
