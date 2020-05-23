

class Resturant

  attr_reader :dishes, :order

  def initialize
    @dishes = [:chicken, :beef, :pasta, :pizza, :burger]
  end

  def show_menu
    @dishes.each { |dish| puts dish }
  end

  def start_order
    @order = []
  end

  def cancel_order
    @order = nil
  end

  def add_to_order(dish, quantity)
    fail "order not started" if !order

    if update_amount?(dish)
      update_amount(dish, quantity)
    else
      add(dish, quantity)
    end
  end

  private

  def update_amount?(dish)
    @order.any? { |dishes| dishes[:dish] == dish }
  end

  def update_amount(dish, quantity)
    @order.each { |dishes| dishes[:amount] += quantity if dishes[:dish] == dish }
  end

  def add(dish, quantity)
    @order.push({dish: dish, amount: quantity})
  end



end
