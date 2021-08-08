require "./lib/messager.rb"
require "./lib/menu.rb"
require "./lib/order.rb"



class Takeaway
  attr_accessor :order_now

  def initialize(menu = Menu.new)
    @messager = Messager.new
    @menu = menu  
  end

  def read_menu 
    @menu.dishes.empty? ? "the menu is empty" : @menu.dishes
  end

  def order(dish, many = 1, order_now = Order.new)
    add_to_order(dish, many, order_now)
  end

  def add(dish, many = 1)
    add_to_order(dish, many, @order_now)
  end

  def add_to_order(dish, many, order_now)
    @order_now, @dish, got_dish = order_now, dish, @menu.get_dish(dish)
    many.times { @order_now.items << got_dish } unless got_dish.nil?
    raise "#{dish} dish is not in the menu" if got_dish.nil?
    "#{many}x #{dish}(s) added to your basket"
  end

  def total 
    @total = 0
    @order_now.items.each { |dish| @total += dish.price }
    "Total: £" << ('%.2f' % @total)
  end

  def basket_summary
    summary = @order_now.items.sort { |a,b| a.name <=> b.name }
    chunk_dishes(summary).join(", ")
  end

  def chunk_dishes(summary)
    summary.chunk_while { |a, b| a.name == b.name }.to_a.map do |dishes|
        "#{dishes[0].name} x#{dishes.count} = £" << ('%.2f' % (dishes.count * dishes[0].price))
    end
  end

end
