class Menu

  attr_reader :menu_list, :print_menu, :menu_item

  def print_menu
    @menu_list = {:tacos => 5,
                  :burrito => 4,
                  :enchiladas => 5,
                  :margarita => 6}
    @menu_print = @menu_list.each {|k,v| puts "#{k} : £#{v}"}
    @menu_print
  end
end
