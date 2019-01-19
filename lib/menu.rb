require_relative 'item'
require_relative 'formatter'
require_relative 'order'
require_relative 'text_message'

class Menu

  attr_reader :names, :items

  def initialize(names, item = Item, formatter = Formatter, order = Order, text = TextMessage)
    @names = names
    @item = item
    @items = create_items
    @formatter = formatter.new
    @order = order.new
    @textmessage = text.new
  end

  def print_menu
    @formatter.format_items(@items)
  end

  def user_input
    order_complete = false
    while order_complete == false
      answer = select_option
      select_volume(answer).times { place_order(answer) }
      order_complete = true if check_finished == "Yes"
    end
  end

  def return_order_total
    @order.order_total
  end

  def confirm_order
    @textmessage.send_message if confirm_order_breakdown == true
  end

  def confirm_order_breakdown
    (return_order_total == order_recount) ? true : (fail "Calculation broken")
  end

  def place_order(choice)
    choice = @item.new(choice)
    @order.place_order(choice)
  end

  private

  def order_recount
    counter = 0
    @order.items.map { |item| counter += item.price }
    counter
  end

  def create_items
    @items = @names.map { |name| @item.new(name) }
  end

  def select_option
    puts "Please select your option"
    gets.chomp
  end

  def select_volume(answer)
    puts "How many #{answer}s would you like?"
    gets.chomp.to_i
  end

  def check_finished
    puts "Is that all?"
    gets.chomp
  end

end
