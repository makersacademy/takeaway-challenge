require_relative 'menu'
require_relative 'send_sms'

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
    "#{quantity} #{item}(s) added"
  end

  def confirm_amount(num)
    @num = num
  end

  def confirmation
    raise 'There was a problem placing your order, please try again.' unless order_processed?
    Send_sms.new
  end

private

  def add_totals
    @menu.list.each do |k, v|
      if k == @item
        @pricelist << (v * @quantity)
      end
    end
  end

  def actual_amount
    @pricelist.inject(:+)
  end

  def order_processed?
    @num == actual_amount
  end
end
