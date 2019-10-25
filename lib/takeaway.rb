require "json"
require_relative 'order'
require 'twilio-ruby'

class Takeaway
    attr_reader :menu, :order, :orders, :order_complete

    def initialize(order = Order)
        @menu = JSON.parse(File.read('./menu.json'))["menu"] 
        @order = order.new
        @orders = []
        @order_complete = false
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
        @order.add_item_to_order(item, quantity)
    end

    def get_order_details
        format_order(@order.order_list)
    end

    def get_order_price
        @order.calculate_total_price
    end

    def complete_order
        @order_complete = true
        process_order
    end 

    private 

    def format_order(order)
        counts = Hash.new(0)
        order.each { |order_name| counts[order_name.name] += 1 }
        return "Order:" + counts.map { |k, v| " #{v} #{k}"}.join(",")
    end

    def process_order(order = Order)
        @orders << @order
        send_text
        @order = order.new
        
    end

    def send_text
        # To Do - pull in code to send the text to the user via twilio
    end
end