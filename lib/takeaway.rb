require './lib/menu'

class Takeaway
  attr_reader :menu
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
    @menu = Menu.new
    @dishes = []
  end

  def show_menu
    @menu.show
  end

  def order
    loop do
      @output.puts "Please type each dish you require followed by return. When you have finished your order press return twice."
      dish = @input.gets.chomp
      if menu.check(dish)
        @output.puts "how many do you want?"
        quantity = @input.gets.to_i
      return true
        @output.puts "Sorry, we don't have that dish - perhaps you've made a spelling mistake?"
      end
    end
  end
  
end
