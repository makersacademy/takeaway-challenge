require_relative 'menu'

class Order

  attr_reader :current_order

  def initialize(menu = Menu)
    @current_order = []
    @menu = Menu.new
  end

  def now
    greeting
    loops
  end

  def get_action
    gets.chomp
  end


  private

  def greeting
    puts "what would you like to order? (type finished when done ordering) "
  end

  def loops
    puts @menu.list
    user_input = get_action
    #if @menu.list.include?(user_input)
      until user_input == "finished"
        p "nice choice"
        puts @menu.list
        @menu.list.each do |x|
          @current_order << x if x[0] == user_input
        end
        user_input = gets.chomp
      end
    #else
    #  "sorry, we don't have that"
    #end
  end



end
