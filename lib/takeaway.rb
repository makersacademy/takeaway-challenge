class Takeaway
  def initialize(menu_klass:,
                 order_klass:,
                 notifier_klass:,
                 delivery_estimator_klass:)
    @menu = menu_klass.new
    @order = order_klass.new
    @notifier = notifier_klass.new
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
