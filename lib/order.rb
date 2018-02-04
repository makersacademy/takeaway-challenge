require_relative 'take_away'

class Order
  attr_reader :take_away, :total_amount, :menu

  def initialize(take_away)
    @take_away = take_away
    @total_amount = 0
  end

  def sum_amount
    take_away.selection.each do |dish, quantity|
      @total_amount += take_away.menu[dish] * quantity
    end
    @total_amount
  end

end