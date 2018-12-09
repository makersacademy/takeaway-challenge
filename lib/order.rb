class Order

  require_relative "./menu.rb"

  attr_reader :total, :cart

  def initialize
    @menu = Menu.new
    @cart = []
    @total = 0
  end

  def add(item, amount = 1)
    item_number = 0
    @cart << { (item_number += 1) => @menu.list[item - 1], "amount" => amount }
  end

end
