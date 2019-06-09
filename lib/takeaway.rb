class Takeaway 
  attr_reader :selected_dishes, :total
  MENU = {
    :olives => 4.00,
    :cheese_board => 10.00,
    :pizza => 8.00,
    :carbonara => 10.00,
    :chicken =>  12.00,
    :salad => 8.00,
    :burrata => 6.00,
    :steak => 15.00,
    :brownie => 5.00
  }

  def initialize
    @selected_dishes = {}
    @total = 0
  end

  def show_menu
    MENU
  end

  def select
    puts 'Type the dish name, close to end'
    loop do
      dish = gets.chomp.to_sym
      if MENU.include?(dish)
        puts 'Quantity ?'
        quantity = gets.chomp.to_i
        @selected_dishes[dish] = quantity
        bills(dish, quantity)
      elsif dish == :close
        break
      else
        puts 'The dish is not in the menu'
      end
      puts 'Next dish'
    end
    @selected_dishes
  end

  def bills(dish, quantity)
    @total += (MENU[dish] * quantity)
  end

  def check_total(user = gets.chomp)
    user = user.to_i
    raise 'The total is not correct' if user != @total
    true
  end

end
