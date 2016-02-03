class Menu

  attr_reader :list_dishes

  def initialize(dishes)
      @list_dishes = dishes
  end

  def print_menu
      @list_dishes.each {|key, value| puts "#{key} for #{value}"}
  end

end
