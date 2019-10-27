require_relative 'menu'

class TakeAway
  attr_reader :summary

  def initialize(menu: Menu.new)
    @todays_dishes = menu.view_list
    @basket = {}
    @summary = []
  end

  def view_menu
    @todays_dishes
  end

  def order
    puts "Please enter the dish (to finish your order, hit return twice)."
    @item = gets.chomp
    while @item.empty? == false do
      puts "Please enter the quantity."
      @quantity = gets.chomp.to_i
      puts "#{@quantity} x #{@item} added"
      @summary << "#{@quantity} x #{@item} = £#{subtotal}"
      @basket[@item] = @quantity
      puts "Please enter the dish (to finish your order, hit return twice)."
      @item = STDIN.gets.chomp
    end
    @basket
  end

  def subtotal
    @todays_dishes.each { |dish, price|
      if @item == dish
        @subtotal = (@quantity * price)
      end
    }
    @subtotal
  end

  def view_summary
    @summary.join("; ")
  end

  def total
    total = 0
    @basket.each { |item, quantity|
      @todays_dishes.each { |dish, price|
        if item == dish
          total += (quantity * price)
        end
      }}
    "Total = £#{total}."
  end

  def submit_order
    puts total + " If this is correct, enter 'yes' to submit your order"
    input = gets.chomp
    return "Confirmation SMS sent" if input == "yes"
    raise "The total is not correct. Please re-submit the order."
  end
end
