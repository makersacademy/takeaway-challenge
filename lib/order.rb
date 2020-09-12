require_relative 'menu'

class Order

  attr_reader :list

  def initialize
    @list = []
  end

  def add(dish)
    @list << dish
  end

  def remove(dish)
    @list.delete(dish)
  end

  def confirm
    send_text
    @list = []
  end

  def total
    total = 0
    @list.each { |dish| 
    total += Menu::MEALS[dish] }
    puts "Your order comes to £#{total}"
  end

  def send_text
    delivery_time = (Time.now+(60*60)).strftime("%H:%M")
    puts "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end

end