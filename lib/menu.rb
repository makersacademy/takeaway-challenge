require_relative 'item'
require_relative 'formatter'
require_relative 'order'

class Menu

  attr_reader :names, :items

  def initialize(names, item = Item, formatter = Formatter, order = Order)
    @names = names
    @item = item
    @items = create_items
    @formatter = formatter.new
    @order = order.new
  end

  def print_menu
    @formatter.format_items(@items)
  end

  def user_input
    order_complete = false
    while order_complete == false
      puts "Please select your option"
      answer = gets.chomp
      puts "How many #{answer}s would you like?"
      volume = gets.chomp.to_i
      volume.times { place_order(answer) }
      puts "Is that all?"
      finished = gets.chomp
      order_complete = true if finished == "Yes"
    end
  end

  def return_order_total
    @order.order_total
  end

  def show_order_breakdown
    (return_order_total == order_recount) ? true : (fail "Calculation broken")
  end

  def place_order(choice)
    choice = @item.new(choice)
    @order.place_order(choice)
  end

    def order_recount
      counter = 0
      @order.items.map { |item| counter += item.price }
      counter
    end

  private


  def create_items
    @items = @names.map { |name| @item.new(name) }
  end

end
