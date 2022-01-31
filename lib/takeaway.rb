require 'twilio-ruby'





class Takeaway
  def initialize
    @dishes = {
      "fish & chips" => 4,
      "chicken & chips" => 3,
      "sausage & chips" => 3,
      "sausage & mash" => 3,
      "chips" => 1,
      "large chips" => 2,
      "full english breakfast" => 10,
      "pudding" => 1,
      "330ml can" => 1
    }
    @selected_dishes = []
  end

  def list_dishes
    @dishes.each do |k,v|
      return "#{k} - £#{v}"
    end
  end

  def select_dish(dish)
    if @dishes.has_key?(dish) == true
      @selected_dishes << dish
      return "#{dish} added!"
    end
  end

  def order_total
    i = 0
    @selected_dishes.each do |x|
      i += @dishes[x]
    end
    return i
  end

  def order_placed
    account_sid = "XXX" 
    auth_token = "XXX" 

    @client = Twilio::REST::Client.new account_sid, auth_token

    from = '+XXX'
    to = '+XXX'
    @client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end