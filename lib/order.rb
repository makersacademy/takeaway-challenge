class Order

  attr_reader :order_list, :menu, :sms, :calc

  def initialize(args = {})
    @sms              = args[:sms]              || Messenger.new
    @menu             = args[:menu]             || Menu.new
    @calc             = args[:calc]             || Calculator.new
    @order_list       = []
  end

  def see_menu
    menu.display_menu
  end

  def order(dish)
    item = menu.check(dish)
    if item.available == 'true'
      @order_list << item
      puts "#{render_name(item.name)} added to your basket"
    else
      raise AvailabilityError
    end
  end

  def view_basket
    puts "Basket Summary: "
    puts "Dishes: "
    order_list.each do |item|
      puts "#{render_name(item.name)}: £#{item.price}"
    end
    puts "Total: £#{total_price}"
  end

  def place_order
    view_basket
    order_list.clear
    sms.send_text
  end

  private 

  def total_price
    prices = order_list.map { |dish| dish.price }
    calc.total(prices)
  end

  def render_name(name)
    name.capitalize.gsub('_', ' ')
  end

end
