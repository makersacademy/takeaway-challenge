class Menu

  attr_reader :options

  def initialize(options = nil)
    @options = options
  end

  def create
    puts 'Input dish'
    dish = gets.chomp
    puts 'Input price, or x for exit'
    price = gets.chomp
    if gets.chomp == "x"
      return @options
    else
      option = { dish => price }
      @options << option
      return @options
    end
  end

  def view
    @options.each do |o|
      puts o
    end
  end

  def select(index)
    return @options.at(index)
  end

  def check(index)
    if select(index) == @options.at(index)
      puts "all ok"
    else
      puts "order system not working"
    end
  end 
end

# puts "Select option No. from menu, or x for exit"
# choice = gets.chomp
# arr1 = Array.new
# while choice != "x" do
#   arr1 << choice
#
# end
