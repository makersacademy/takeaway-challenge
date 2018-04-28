class Dishes

  attr_accessor :menu

  def initialize(menu = @menu)
    @menu = menu
  end

  def print_menu
   menu.each_with_index do |dish, index|
     puts "#{index + 1}. #{dish[:dish]}: £#{dish[:price]}"
   end
  end

  def in_menu?(selection)
    p menu.find{|dish| dish[:dish] == selection} != nil
  end

end
