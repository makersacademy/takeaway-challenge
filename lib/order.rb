require './lib/menu'
require './lib/messager'

class Order

  attr_reader :basket, :total, :messager

  def initialize(menu_klass)
    @menu_klass = menu_klass
    @basket = []
    @total = 0
    @messager = Messager.new
  end

  def make_order(hash)
    hash.each do |order,amount|
      amount.times do
        (@menu_klass.menu.each do |food,price|
          if food == order
            self.basket << {food => price}
          end
        end)
      end
    end
    @messager.message
    basket_summary
  end

  def complete_order
    self.basket.each do |instance|
      instance.each do |food,price|
        @total += price
      end
    end
  end

  def checkout(price)
    fail "That is not the right total" if price != @total
    @messager.message
  end

  private

  def basket_summary
    self.basket
  end

end
