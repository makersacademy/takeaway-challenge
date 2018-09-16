require_relative 'menu'

class Order
  attr_reader :current_total
  def initialize
    @current_total = 0
    @menu = Menu.new
  end

  def add(list)
    list.each do |dish, amount|
      @current_total += (@menu.prices[dish]).to_f * amount.to_f
    end
  end

  private

  def is_correct?(given_total)
    @current_total == given_total
  end
end
