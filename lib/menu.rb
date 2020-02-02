class Menu

  attr_reader :nested_menu

  def initialize
    @nested_menu = [
      ["chocolate", 0.50],
      ["rasperries", 0.25],
      ["ice_cream", 3.72]
    ]
  end

  def print_menu
    print "Menu is as follows:\n"
    @nested_menu.each_with_index do |item, index|
      print "#{index+1}. #{item[0]}, £#{item[1]}\n"
    end
  end
end
