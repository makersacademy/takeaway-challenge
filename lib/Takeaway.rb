require 'twilio-ruby'
require 'Menu'
class Takeaway
  def initialize
    @items =[]
    @number = ENV['mynumber']
  end

  def displayMenu
    print Menu.displayMenu
  end

  def pickItem(item)
    if(Menu.containsItem(item))
      @items.push(item)
    else
      fail "That item is not valid"
    end
  end

  def getReciept(items = @items)
    puts Menu.getItemAndCost(items)
    puts Menu.getCost(items).to_s
  end

  def order
    text = "Thank you! Your order was placed and will be delivered before 18:52"
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
        :body => text,
        :to => @number,	     # My PHONE number
        :from => "+18482835735" 	# My TWILIO number
        )  
    puts message.sid
  end

  #requires verifiaction which isn't inplemented yet
  def addNumber(number = ENV['mynumber'])
    @number = number
  end
end