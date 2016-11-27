class Menu

  attr_accessor :menu_list

  def initialize(dishes)
    @menu_list = dishes
  end

  def view_menu
    menu_list.each { |k,v| puts "#{k} " + "%.2f" % v }
  end

  def in_menu?(item)
    menu_list.has_key?(item)
  end

  def check_price(item)
    menu_list[item]
  end

end
