class Menu

  attr_reader :menu_list, :print_menu

  def print_menu
    @menu_list = {:tacos => 5.00,
                  :burrito => 4.00,
                  :enchiladas => 5.00,
                  :margarita => 6.00}
    @menu_print = @menu_list.each {|k,v| puts "#{k} : £#{v}"}
    @menu_print
  end
end
