require_relative './menu.rb'

class Order
  attr_reader :order, :running_total, :order_summary

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

  def summary
    @order_summary = []
    # iterate through each dish on menu and count quantity in order
    @menu.dishes.values.each do |dish|
      @order_summary << {
        :item => dish.name,
        :price_per_item => dish.price,
        :quantity => @order.count { |choice| choice.name == dish.name }
      }
      end
    @order_summary
  end

  def calculate_total(order)
    # iterate through order summary and multiply quantity by dish.price
    @total = 0
    order.each do |dish|
      @total += dish[:quantity] * dish[:price_per_item]
    end
    @total
  end

  def prints_order_summary(order)
    order_output = []
    order.each do |summary|
      if summary[:quantity] != 0
        order_output << "#{summary[:item]} x #{summary[:quantity]}"
      end
    end
    formatted_total = format('%<price>.2f', price: @total)
    puts "You have ordered:\n" + order_output.join(",\n") +
    ".\nThe total comes to £#{formatted_total}."
  end

  def place_order
    summary
    calculate_total(@order_summary)
    prints_order_summary(@order_summary)
    # fail if @total is not corrected - I don't understand what 2 things we're comparing

    send_text
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
