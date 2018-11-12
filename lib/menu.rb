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
    account_sid = "*******************************"
    auth_token = "********************************"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank You! Your order has been placed!",
        to:   "+444573910384",
        from: "+443450924051")
  end


end
