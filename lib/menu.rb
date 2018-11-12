class Menu

  attr_reader :display, :my_lunch, :total

  def initialize

    @display  = {
      "3"     =>  "Soup",
      "4"     =>  "Pasta",
      "6"     =>  "Bangers and Mash",
      "5"     =>  "BLT Sandwich",
      "7"     =>  "Fish n Chips"
    }
    @my_lunch = []
    @total    = 0
  end

  def calculate

    @display.each do |key, value|
      if key.to_i < 6
        @my_lunch.push(key)
      end
    end

    @my_lunch.each do |x|
      @total += x.to_i
    end

    @total
  end

  def sms
    account_sid = "AC9c8b244f0356492969a5f19a729405fe"
    auth_token = "e407b2742416e159bab79a43f30c8cd4"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank You! Your order has been placed!",
        to:   "+447930984305",
        from: "+441301272031")
  end


end
