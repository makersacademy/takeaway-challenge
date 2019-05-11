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
end



private

  def add_totals
    @menu.list.each do |k, v|
      if k == @item
        @pricelist << (v * @quantity)
      end
    end
  end
