class Menu

  attr_reader :contents

  def initialize
    @contents = { beef: 11,
                  fish: 13,
                  dahl: 9,
                  rice: 6  }
  end

  def show_menu
    @contents.each { |key, val|
      print "Dish: #{key}: "
      puts "£#{val}" }
  end

  def pick(item)
    @contents[item]
  end
end
