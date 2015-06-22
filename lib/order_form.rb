require_relative 'takeaway'
require_relative 'menu'

class OrderForm

  attr_reader :order 
  attr_accessor :takeaway

  def initialize
    @order = []
    @dishes = Menu.new.dishes
    @takeaway = Takeaway.new
  end

  def show_dishes
    @dishes.map{ |k,v| "#{k} (£#{'%.2f' % v})"}.join(', ')
  end

  def add_dish dish, quantity
    fail 'Not on the menu' unless @dishes.has_key?(dish)
    quantity.times { order << dish }
    "#{quantity} x #{dish} added"
  end

  def check_total customer_estimate
    fail 'No dishes were selected' if (order.length == 0)
    fail 'Error, total incorrect' unless (customer_estimate == calculate_total)
    takeaway.send_text
  end

  def calculate_total
    total = 0.00
    order.each { |item| total += @dishes[item] }
    total
  end

end