require './lib/menu'

class Takeaway
  attr_reader :menu, :summary

  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
    @menu = Menu.new
    @dishes = []
    @summary = []
    @total = 0
  end

  def show_menu
    @menu.show
  end

  def order
    loop do
      dish = ask_for_order
      return confirm_order if dish == "" 
      if menu.check(dish)
        quantity = ask_for_quantity
        log_order(dish, quantity)
      else
        clarify_order
      end
    end
  end

  def confirm_order
    @summary.each do |dish|
        @output.puts "#{dish[:quantity]} order of #{dish[:food]} at £#{menu.price(dish[:food])} each"
        @total += menu.price(dish[:food])
    end
    @output.puts "Total order is £#{@total}"
  end

  private


  def ask_for_order
    @output.puts <<~ORDER 
    Please type each dish you require followed by return. 
    When you have finished your order press return twice.
    ORDER
    dish = @input.gets.chomp
  end

  def clarify_order
    @output.puts "Sorry, we don't have that dish - perhaps you've made a spelling mistake?"
  end

  def ask_for_quantity
    @output.puts "how many do you want?"
    quantity = @input.gets.to_i
  end

  def log_order(dish, quantity)
    order_item = {}
    order_item[:food] = dish
    order_item[:quantity] = quantity
    @summary << order_item
  end
  
end
