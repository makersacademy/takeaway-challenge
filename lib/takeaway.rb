class Takeaway
  def initialize(menu_klass:,
                 menu_loader_klass:,
                 order_klass:,
                 order_total_klass:,
                 notifier_klass:,
                 config_loader_klass:,
                 delivery_estimator_klass:)
    @menu = menu_klass.new(menu_loader_klass: menu_loader_klass)
    @order = order_klass.new(order_total_klass: order_total_klass)
    @notifier = notifier_klass.new(config_loader_klass: config_loader_klass)
    @estimator = delivery_estimator_klass.new
  end

  def print_menu
    @menu.to_s
  end

  def pick_item(description)
    @menu.choose(description)
  end

  def verify_total(estimated_total)
    estimated_total == @order.total
  end

  def add_to_order(dish, qty)
    @order.add(dish, qty)
  end

  def notify
    @notifier.notify(@estimator.eta)
  end
end
