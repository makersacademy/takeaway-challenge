class Order

  attr_reader :summary, :menu

  def initialize (menu_klass = Menu.new, order_summary_klass\
    = OrderSummary.new, sms_klass = SMS.new)
    @summary = order_summary_klass
    @menu = menu_klass
    @sms = sms_klass
  end

  def add_item name, quantity = 1
    fail "Sorry we don't have #{name} on the menu" unless item_on_menu? name
    @summary.basket[name] += quantity
    return "#{quantity} #{name}(s) added to your order"
  end

  def total_price
    price_calculator
  end

  def confirm_order price
    fail "Sorry our records don't match, we believe the total price is £#{ total_price }.  Please check your order." unless price_correct? price
    @sms.send_sms
    @basket = Hash.new(0)
  end

  private

  attr_reader :sms

  def item_on_menu? name
    @menu.dishes.include? name
  end


  def price_calculator
    total = 0
    @summary.basket.each { |name, quantity| total += (quantity *\
    price_matcher(name)) }
    total
  end

  def price_matcher name
    @menu.dishes[name]
  end

  def price_correct? price
    total_price == price
  end

end
