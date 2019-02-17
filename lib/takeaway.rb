# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order, :dishes

  def initialize(order = Order.new)
    @order = order
    @dishes = [
      { name: :rice, price: 3.00 }, { name: :noodles, price: 3.50 }, 
      { name: :prawn_crackers, price: 1.00 }, 
      { name: :spring_rolls, price: 2.50 }
    ]
    main_menu
  end

  def main_menu
    loop do
      menu
      puts '--------------------'
      options
    end
  end

  def menu
    index = 1
    @dishes.each do |dish|
      puts "#{index}: #{dish[:name]} (£#{dish[:price]})"
      index += 1
    end
  end

  def options
    puts '[S]how order'
    puts '[P]lace order'
    puts '[C]ancel order/quit'
    puts 'Please key-in your choice from the options above:'
    process_input(gets.chomp)
  end

  def process_input(input)
    case input.to_s.downcase
    when 'c'
      exit
    when 's'
      @order.show_items
    when 'p'
      @order.place
    else
      @order.add_dish(@dishes[input.to_i - 1])
    end
  end

end
