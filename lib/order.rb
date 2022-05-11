require_relative 'menu'
require_relative 'SMS'

class Order

  attr_reader :selection, :items, :total

  def initialize(items = Menu.new.items)
    @selection = []
    @items = items
    @total = 0
  end

  def view_menu
    @items
  end

  def add(item_index)

    fail 'item not available' if @items[item_index - 1][:available] == false
    @selection << @items[item_index - 1]
    @total += @items[item_index - 1][:price]
    @selected_item = @items[item_index - 1][:scaldy]
    item_added_confirmation
  end

  def checkout
    p check_order_prompt, @selection, total_summary
    # checkout_confirmation
  end

  def check_order_prompt
    "Please check your order against your total:"
  end

  #did I understand User Story 3 correctly or did I go overboard?
#   'As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches
# the sum of the various dishes in my order'
#did I satisfy this condition simply by giving the customer a 'total' method?

  def selection_summary
    @selection
  end

  def total_summary
    "Your total is: £#{@total}. Please use the complete_order function, entering your phone number as an argument, to complete your order"
  end

  def item_added_confirmation
    "You successfully added #{@selected_item} to your basket"
  end

  def complete_order(phone_number)
    SMS.new.send_sms(phone_number)
  end
end

#complete_order is failing its tests, saying that it expected 1 argument
#and got 0, even
