require_relative 'menu'

class Takeaway

  attr_reader :menu_klass, :complete_order, :total_bill

  def initialize(args)
    @menu_klass     = args[:menu_klass]
    @send_sms_klass  = args[:send_sms_klass]
    @complete_order = {}
    @total_dishes   = 0
    @total_bill     = 0
  end

  def select_order(item, qty)
    @complete_order[item] = qty
  end

  def total_of_dishes
    number_of_dishes
  end

  def total_price
    bill_calculator
  end

  def text_confirmation(args)
    @send_sms_klass.confirmation_text(args)
  end

  private

  def number_of_dishes
    @complete_order.each_value {|value| @total_dishes += value }
    @total_dishes
  end

  def bill_calculator
    @complete_order.each do |k,v|
      @total_bill += @menu_klass.list[k]*v
    end
    @total_bill
  end
end
