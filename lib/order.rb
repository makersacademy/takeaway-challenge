require_relative './menu.rb'
require_relative './invoice.rb'

class Order
  attr_reader :order, :total, :order_summary

  def initialize(menu = Menu.new, invoice = Invoice.new)
    @menu = menu
    @order = []
    @invoice = invoice
  end

  def view_menu
    @menu.view
  end

  def select(item, quantity)
    choice = item.downcase.to_sym
    quantity.times { @order << @menu.select(choice) }
  end

  def summarise(order)
    @order_summary = []
    # iterate through each dish on menu and count quantity in order
    @menu.dishes.values.each do |dish|
      @order_summary << {
        :item => dish.name,
        :price_per_item => dish.price,
        :quantity => order.count { |choice| choice.name == dish.name }
      }
    end
    @order_summary
  end

  def calculate_total(order)
    @total = @invoice.calculate(order)
  end

  def prints_order_summary(order)
    order_output = []
    order.each do |summary|
      if summary[:quantity] != 0
        order_output << "#{summary[:item]} x #{summary[:quantity]}"
      end
    end
    puts "You have ordered:\n" + order_output.join(",\n") +
    ".\nThe total comes to £#{@total}."
  end

  def place_order
    summarise(@order)
    order = @order_summary
    calculate_total(order)
    prints_order_summary(order)
    # fail if @total is not corrected - I don't understand what 2 things we're comparing

    @invoice.send_text
  end

  # def order
  #   @order.dup
  # end
end
