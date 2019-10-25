require "json"
require 'order'


class Takeaway
    attr_reader :menu, :order

    def initialize(order = Order)
        @menu = JSON.parse(File.read('./menu.json'))["menu"] 
        @order = order.new
    end

    def show_menu
        @menu.map { |item| "#{item["item"]}: £#{item["price"]}"}.join(", ")
    end

    def add_customer_details(customer)
        @order.new_customer(customer)
    end

    def get_customer_details
        @order.customer
    end

    def add_item(item, quantity = 1)
        
    end


end