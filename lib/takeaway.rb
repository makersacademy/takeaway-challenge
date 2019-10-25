require "json"
require 'order_history'


class Takeaway
    attr_reader :menu, :customers
    def initialize(orderHistory = OrderHistory)
        @menu = JSON.parse(File.read('./menu.json'))["menu"] 
        @order_history = orderHistory.new
        @customers = []
    end

    def new_order(customer)
        @customers << customer
        @order_history.create_new_order(customer)
    end


end