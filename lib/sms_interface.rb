require_relative 'order'

class SMSInterface
  def initialize(order_inst = Order.new)
    @order = order_inst 
  end
  
  def treat(order_args)
    sanitised_args = sanitise_order(order_args)
    @order.place(*sanitised_args)
  end

  private

  def sanitise_order(order_args)
    split_args = split_by_commas(order_args)
    split_args.map! { |str| digits_to_i(str) }
  end
  
  def split_by_commas(str)
    str.downcase.split(", ")
  end

  def digits_to_i(str)
    !str[/\d/].nil? ? str.to_i : str
  end
end
