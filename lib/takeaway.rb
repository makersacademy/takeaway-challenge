# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order, :dishes

  def initialize
    @dishes = [
      { name: :rice, price: 3.00 }, 
      { name: :noodles, price: 3.50 }, 
      { name: :prawn_crackers, price: 1.00 }, 
      { name: :spring_rolls, price: 2.50 }
    ]
  end

  def new_order(order = Order.new)
    @order = order
    loop do
      menu
      puts '--------------------'
      options
    end
  end

  def place_order
    @order.place
    @order = nil
    exit
  end

  def menu
    index = 1
    @dishes.each do |dish|
      puts "#{index}: #{dish[:name]} (£#{dish[:price]})"
      index += 1
    end
  end

  def add_to_order(dish)
    @order.add_dish(dish)
  end

  def options
    puts '[S]how order'
    puts '[P]lace order'
    puts '[C]ancel order'
    puts 'Please key-in your choice from the options above:'
    input = gets.chomp
    case input.to_s.downcase
    when 'c'
      exit
    when 's'
      @order.show_items
    when 'p'
      place_order
    else
      add_to_order(@dishes[input.to_i - 1])
    end
  end

end
