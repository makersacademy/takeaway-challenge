require_relative './menu.rb'
require_relative './messenger.rb'

class Order

  attr_reader :entries, :menu, :messenger

  def initialize(menu, messenger = Messenger.new)
    @entries = []
    @menu = menu
    @messenger = messenger
  end

  def add_entry(dish_name, quantity = 1)
    raise "Dish not found" unless dish = @menu.get(dish_name)
    quantity.times { @entries << dish }
    @entries
  end

  def total_amount
    @entries.inject(0) { |memo, hsh| memo + hsh[:price] }
  end

  def place(total, name, phone_number)
    raise "The total provided is incorrect" unless total == total_amount
    @messenger.send_message(name, phone_number)
    "Your oder has been placed. You will receive an SMS confirmation shortly"
  end
end
