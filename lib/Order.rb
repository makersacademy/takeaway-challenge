require 'send_sms'
class Order
  attr_reader :menu, :order, :total, :sms
  def initialize(menu: Menu.new, sms: Sms.new)
    @menu = menu.menuItems
    @order = []
    @total = 0
    @sms = sms
  end

  def foodSelection(foodItem)
    @menu.each do |menuitem|
      if menuitem[:name] == foodItem
        @order << menuitem
      end
    end
  end

  def currentOrder
    @order
    # totalPrice
  end

  def finishOrder
    @sms.sendMessage(totalPrice)
  end

  def totalPrice
    @order.each do |menuitem|
      @total += menuitem[:price].to_f
    end
    return "£#{@total}"
  end
end
