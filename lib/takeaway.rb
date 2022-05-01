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
    @output.puts "Please type each dish you require followed by return. When you have finished your order press return twice."
    @dish = @input.gets.chomp
  end
  
end
