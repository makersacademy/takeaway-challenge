require_relative './menu.rb'

class Order
  attr_reader :order, :running_total

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
    @running_total = 0
  end

  def view_menu
    @menu.view
  end

  def select(item, quantity)
    choice = item.downcase.to_sym
    quantity.times { @order << @menu.select(choice) }
  end

  def order_summary
    @order_summary = []
    @order.each do |dish|
      # look to see if order summary already contains dish name
      selection = @order_summary.find { |item| item.value?(dish.name) }
      if selection != nil # if choice is already in order list
        selection[:quantity] += 1
      else
        @order_summary << { :item => dish.name, :quantity => 1 }
      end
      @running_total += dish.price
    end
    prints_order_summary
  end

  def prints_order_summary
    order_output = []
    @order_summary.each do |summary|
      order_output << "#{summary[:item]} x #{summary[:quantity]}"
    end
    formatted_running_total = format('%<price>.2f', price: @running_total)
    puts "You have ordered:\n" + order_output.join(",\n") +
    ".\nThe total comes to £#{formatted_running_total}."
  end

  def place_order

  end

  # def order
  #   @order.dup
  # end

  def order_summary2
    order_summary = {}
    @order.each do |dish|
      name = dish.name

      if order_summary[name] == nil
        order_summary[name] = 0
      end

      order_summary[name] += 1
    end
    order_summary
  end
end
