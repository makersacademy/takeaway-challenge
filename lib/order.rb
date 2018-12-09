require_relative "menu"

class Order

  def initialize(menu = Menu.new)
    @menu = menu.list
    @item = nil
    @quantity = nil
    @basket = []
    @ordering = true
  end

  def choose
    loop_select
  end

  private

  def loop_select
    while @ordering do
      select_item
      quantity
      confirm_order
      something_else?
    end
    @basket
  end

  def something_else?
    puts "Would you like to order something else : y or n"
    reply = gets.chomp
    @ordering = false if reply == "n"
  end

  def select_item
    puts "Please enter the list's number of the dish that you would like : "
    index = gets.chomp.to_i
    @item = @menu[index - 1]
  end

  def quantity
    puts "Please enter the number of the quantity that you would like for
    this dish : "
    @quantity = gets.chomp.to_i
  end

  def confirm_order
    @quantity.times do
      @basket << @item
    end
    @basket
  end
end
