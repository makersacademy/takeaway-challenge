require 'order_checker'

class Order

  include OrderChecker

  attr_reader :order_detail, :order_total_cost
  attr_accessor :total_check, :menu 

  def initialize(options={})
    @order_detail=options.fetch(:order_detail, {})
    @order_total_cost=options.fetch(:order_total_cost, 0)
  end  

  def confirm_order(customer, assistant)
    assistant.confirm_order(customer)
  end  

end