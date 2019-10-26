# Place the order by giving a list of dishes, their quantities and a total
require './lib/menu'

class Order

  attr_reader :customer, :phone_number, :basket, :total, :menu

  def initialize(customer, phone_number, expected_total)
    @customer = customer
    @phone_number = phone_number
    @basket = {}
    @total = 0.00
    @expected_total = expected_total
    @menu = Menu.new
  end
 
  def take_order
    @menu.display
    enter_dishes
    place_order
  end

  def enter_dishes
    p "Please enter your order, type quit to end"
    choice = gets.chomp
    while choice != "quit" do
      add_choice(choice)
      p "Please enter your order, type quit to end"
      choice = gets.chomp
    end
  end

  def add_choice(choice)
    return false unless @menu.include?(choice)
    @basket[choice] ? @basket[choice] += 1 : @basket[choice] = 1
    @total += @menu.get_price(choice).round(2)
  end

  def display_order
    p "Your order is #{@basket} and it comes to £#{@total.round(2)}"
  end

  def place_order
    raise "Totals do not match" if @total.round(2) != @expected_total

    send_text
  end

  def send_text
    time = Time.now + (60 * 60)
    time_str = "Thank you! Your order was placed and will be delivered before"
    p time_str
    p time.strftime("%k:%M")
    time_str 
  end

  def return_expected_total
    @expected_total
  end

  def return_total
    @total.round(2)
  end

  def return_basket
    @basket
  end

end
