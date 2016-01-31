require_relative 'restaurant'
require_relative 'messager'

class Order
  extend Forwardable

  attr_reader :messager_klass
  def_delegator :@messager_klass, :send_sms, :send_order


  def initialize(messager_klass = Messager)
    @history = {}
    @messager_klass = messager_klass.new
  end

  def add_item(menu_item, quantity)
    @history[menu_item] = quantity
    item_added_confirmation(menu_item, quantity)
  end

  def history
    @history.dup
  end

  def confirm_order(total)
    total_mismatch_error(total)
    send_order("Thank you! Your order was placed and will be delivered before #{hour_ahead}")
  end

  private

  def item_added_confirmation(menu_item, quantity)
    print "#{quantity} #{menu_item.name} added to your order"
  end

  def total_mismatch_error(total)
    raise 'Total given does not match calculated total' if total != order_total
  end

  def order_total
    sub_totals.reduce(:+)
  end

  def sub_totals
    @history.collect {|menu_item, quantity| menu_item.price * quantity}
  end

  def hour_ahead
    (Time.now+3600).strftime('%H:%M')
  end

  # def show_order
  #   puts @history.each {|key, value| key.name}
  # end


end
