require_relative 'takeaway'
require_relative 'menu'

class Order

  attr_reader :orders, :total, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = []
    @total = 0
    @item_count = Hash.new(0)
  end

  def view_menu
    @menu.all
  end

  def add(name, qty)
    @orders << { name: name, price: @menu.dishes[name], qty: qty }
    @total += (@menu.dishes[name] * qty)
    "Item: #{name} | Qty: #{qty} | $#{@menu.dishes[name]} - added to order"
  end

  def view
    @orders.each { |item| @item_count[item[:name]] += item[:qty] }
    @item_count.each { |k, v| puts "Item: #{k} | Qty: #{v} | $#{(@menu.dishes[k] * v)}" }
  end

end
