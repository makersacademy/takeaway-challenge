class Customer

  attr_accessor :order, :total_price, :total_quantity
  attr_reader :summary

  def initialize
    @order = {}
    @total_price = 0
    @total_quantity = 0
    # @summary = [["Item","Quantity","Price"]]
  end

  def check_menu(menu)
    menu.view_menu
  end

  def add_to_order(menu,food,quantity)
    self.order.has_key?(food.to_sym) ? self.order[food.to_sym][0] += quantity : order[food.to_sym] = [quantity, menu.items[food.to_sym]]
    self.calculate_total_price
    self.calculate_total_quantity
  end

  def calculate_total_price
    self.total_price = 0
    order.each {|k,v| self.total_price += v[0]*v[1] }
  end

  def calculate_total_quantity
    self.total_quantity = 0
    order.each {|k,v| self.total_quantity += v[0] }
  end

  def view_order
    puts "Item".ljust(20) + "Quantity".center(20) + "Price".rjust(20)
    order.each do |k,v|
      puts "#{k}".ljust(20) + "#{v[0]}".center(20) + "#{v[0]*v[1]}GBP".rjust(20)
    end
    puts "Total".ljust(20) + "#{total_quantity}".center(20) + "#{total_price}GBP".rjust(20)
  end

  def place_order
    fail "Total price miscalculation" if self.total_price != order.values.inject(0) {|result,element| result + element[1]}
    load '/Users/khalidkarim/desktop/projects/takeaway/lib/send-sms.rb'
  end


end
