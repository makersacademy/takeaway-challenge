require_relative 'take_away'

class Order
  attr_reader :take_away, :total_amount, :menu

  def initialize(take_away)
    @take_away = take_away
    @total_amount = 0

    sum_amount
  end

  def place_order(selection, amount)
    raise "Wrong amount for your order" if amount != total_amount

    "Thank you! Your order was placed and will be delivered before 18:52"
  end

  private

  def sum_amount
    take_away.selection.each do |dish, quantity|
      @total_amount += take_away.menu[dish] * quantity
    end
    @total_amount
  end
end
