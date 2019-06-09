class Takeaway 
  attr_reader :selected_dishes
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
      elsif dish == :close
        break
      else
        puts 'The dish is not in the menu'
      end
      puts 'Next dish'
    end
    @selected_dishes
  end

#   def loop_user_input(user_selection)
#     loop do
#       dish = gets.chomp.to_sym
#       if MENU.include?(dish)
#         user_selection << dish
#       elsif dish == :close
#         break
#       else
#         puts 'The dish is not in the menu'
#       end
#       puts 'Type next dish'
#     end
#   end

# private
#   def store(user_selection)
#     user_selection.each { |key|
#       @selected_dishes[key] == nil ? @selected_dishes[key] = 1 : @selected_dishes[key] += 1
#       @total += MENU[key]
#     }
#     @selected_dishes
#   end

end
