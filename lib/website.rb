require_relative 'menu'

class Website

  attr_reader :item, :quantity, :pricelist

  def initialize(menu = Menu.new)
    @pricelist = []
    @menu = menu
  end

  def show_menu
    @menu.list
  end

  def select(item, quantity)
    @item = item.to_s
    @quantity = quantity.to_i
    add_totals
  end

  def confirm_amount(num)
    @num = num
  end

  def actual_amount
    @pricelist.inject(:+)
  end

  def order_processed?
    @num == actual_amount
  end

  def confirmation
    raise 'There was a problem placing your order, please try again.' unless order_processed?
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

private

  def add_totals
    @menu.list.each do |k, v|
      if k == @item
        @pricelist << (v * @quantity)
      end
    end
  end
end
