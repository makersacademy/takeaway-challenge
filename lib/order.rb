
class Order

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add_dish(dish, quantity = 1) #error if item not available
    @basket[dish] += quantity
    action_completed('add',dish,quantity)
  end

  def remove_dish(dish, quantity = 1) #Make custom error!
    fail("Not in basket") if not_in_basket?(dish,quantity)
    @basket[dish] -= quantity
    action_completed('remove',dish,quantity)
  end

  def review_order
    fail("Nothing in basket") if @basket.empty?
    @basket.map { |dish,quantity| [dish.name, quantity] }.to_h
  end

  def order_total
    @basket.keys.map { |dish| dish.price.to_f * @basket[dish].to_f }.reduce(:+)
  end


  private

  def not_in_basket?(dish,quantity)
    @basket[dish] < quantity || @basket[dish] == nil
  end

  def action_completed(act, dish, qty)
    act == 'add' ? "Added: #{dish.name} x#{qty}" : "Removed: #{dish.name}x#{qty}"
  end

end
