require_relative 'takeaway'
require_relative 'dish'

class Interface

  @@console_width = 60

  def initialize
    @takeaway = Takeaway.new([])
    @dishes = []
    launch!
  end

  private

  def launch!
    cmd = ''
    while true
      show_options
      cmd = get_cmd
      break if cmd == 'Q'
      puts ""
      run(cmd.to_i)
    end
  end

  def run(cmd)
    case cmd
      when 1 then add_dish
      when 2 then show_menu
      else puts "Command not recognised."
    end
  end

  def add_dish
    print "Enter a name for the dish:\n"
    name = gets.chomp
    print "Enter its price:\n"
    price = gets.chomp.to_f
    @dishes << Dish.new(name, price)
    @takeaway = Takeaway.new(@dishes)
  end

  def show_options
    print "\nChoose from one of the options below:\n"
    puts divider
    options.each_with_index do |option, index|
      print three_col_line((index+1).to_s,option[:name],option[:desc])
    end
    puts divider
    print "Enter a number from the above menu and hit return.\n"
    print "'Q' to quit\n\n"
  end

  def options
    opt1 = {name: "Add dish", desc: "Add a dish to the restaurant's menu"}
    opt2 = {name: "Show menu", desc: "Show the menu"}
    options = [opt1, opt2]
  end

  def get_cmd
    cmd = gets.chomp
  end

  def show_menu
    puts @takeaway.list_dishes
  end

  def three_col_line(str1, str2, str3)
    str1.ljust(5) + str2.ljust(20) + str3.rjust(@@console_width-25) + "\n"
  end

  def divider
    '-' * @@console_width
  end

end

Interface.new
