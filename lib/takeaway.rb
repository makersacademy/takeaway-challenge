require "json"
require 'order_history'
require 'order'


class Takeaway
    attr_reader :menu, :customers, :order_history

    def initialize(orderHistory = OrderHistory)
        @menu = JSON.parse(File.read('./menu.json'))["menu"] 
        @order_history = orderHistory.new
        @customers = []
    end

    def show_menu
        @menu.map { |item| "#{item["item"]}: £#{item["price"]}"}.join(", ")
    end

    def new_order(customer)
        @customers << customer
        @order_history.create_new_order(customer)
    end


end