# allows selection from menu into basket
class Menu_selection

  attr_reader :selection

  def initialize(menu)
    print_options
    process_selection(STDIN.gets.chomp.to_i, menu)
  end

  def print_options
    puts "Which item would you like to order? (select by menu number)\n"
    print ">  "
  end

  def process_selection(choice, menu)
    fail 'That item doesn\'t exist' if choice < 0 || choice > ( menu.count + 1 )
    @selection = menu.select { |menu| menu[:item] == choice }
  end

end
