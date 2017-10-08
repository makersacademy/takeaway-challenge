require 'twilio-ruby'

class Takeaway

attr_reader :menu, :name

  def initialize
    @menu = {"Spring Rolls" => 4,
            "Crispy Prawns" => 5,
            "Pork Skewers" => 6,
            "Tom Yum" => 7,
            "Green Curry" => 7,
            "Chang Beer" => 2}
    @name
    welcome_message
  end

  def view_menu
    menu
  end

  def new_order(name)
  @name = Order.new(name)
  end

  def select_dish(dish_name, number)
    dish_and_price = @menu.select {|k,v| k == dish_name}
    number.times {@name.addto_order(dish_and_price)}
  end

  def verify_order
    "#{@name.dish_list} #{@name.total}"
  end

  def place_order
  time = Time.new + (60 * 60)
  "Thank you! Your order was placed and will be delivered before #{time.strftime('%I:%M%p')}"
  end

  # def place_order
  #   account_sid = "ACc4f9ba92a70a60ff60b6b0991011ddda"
  #   auth_token = "d81477b5a864b24554cfabb3f5a6abc7"
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   time = Time.new + (60 * 60)
  #   message = @client.messages.create(
  #       body: "Thank you! Your order was placed and will be delivered before #{time.strftime('%I:%M%p')}",
  #       to: "+447814548040",
  #       from: "+441138590979")
  #   puts message.sid
  # end

  private

  def welcome_message
    puts "Welcome to Pad Thai."
  end

end
