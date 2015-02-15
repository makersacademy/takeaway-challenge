require 'twilio-ruby'

class Takeaway

  def dish_list
    @dish_list = {
      sandwich:   5,
      pasta:      7.5, 
      salad:      6,
      coke:       1
    }
  end

  def check_order(order, total)
    bill = order.map { |dish| dish_list[dish] }.inject(:+)
    if bill == total
      send_message
      true
    else
      raise "sum is incorrect"
    end
  end

  def send_message
    time = Time.new + 3600
    @account_sid  = "private"
    @auth_token   = "private"
    @from_number  = 000000000000 #private
    @to_number    = 111111111111 #private
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account
    @message = @account.messages.create({
      :from => @from_number, 
      :to => @to_number, 
      :body => "Thank you! Your order was placed and will be delivered before #{time}"})
    puts @message
  end

end