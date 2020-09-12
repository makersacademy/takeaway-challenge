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
    total
  end

  def send_text
    puts "Thank you! Your order was placed and will be delivered before 18:52"
  end

end