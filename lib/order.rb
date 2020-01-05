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
    @orders << { name: name, price: @menu.price(name), qty: qty }
    @total += (@menu.price(name) * qty)
    "Item: #{name} | Qty: #{qty} | $#{@menu.price(name)} - added to order"
  end

  def view_order
    @orders.each { |item| @item_count[item[:name]] += item[:qty] }
    @item_count.each { |k, v| puts "Item: #{k} | Qty: #{v} | $#{(@menu.price(k) * v)}" }
  end

  def item_available?(name)
    @menu.available?(name)
  end

end
