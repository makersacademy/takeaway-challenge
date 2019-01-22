class Menu

  attr_reader :dishes

  def initialize
  end

  def see_menu
    puts "Menu Items".rjust(20)
    puts "----------".rjust(20)
    @dishes.each do |key, value|
      puts "#{key} ------ £#{value}"
    end
  end

end
