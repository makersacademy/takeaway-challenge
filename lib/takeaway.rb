require 'twilio-ruby'

# put your own credentials here
#taken them out for pull request

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

class Menu
  def initialize
    @list_of_dishes = []
  end
  def list_of_dishes
    @list_of_dishes
  end
end

class Meal
  attr_accessor :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def list_price
    @price
  end

  def list_name
    @name
  end
end

def send_a_text
  @client.messages.create(

  )
  puts ("tried to send a text")
end

def show_menu
  puts("Available dishes: ")
  puts(m.list_of_dishes)
  puts("To make an order, specify the meal, followed by the quantity")
  make_order
end

def make_order
  order = []
  p("name of meal:")
  ordername = gets.chomp
  p("quantity:")
  orderquan = gets.chomp.to_i
  order << ordername
  order << orderquan
  process_order(order)
end

def process_order(order)
end

m = Menu.new
chips = Meal.new("chips", 5)
kfc = Meal.new("KFC", 3)
m.list_of_dishes << chips
m.list_of_dishes << kfc
make_order
