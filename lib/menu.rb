class Menu

  def show_menu
    @list = {:chips => 2.5, :cod => 4.5, :plaice => 4, 
    :haddock => 3, :picked_egg => 1.5, :fishcake => 2.5}
    @list.each  {|k, v| puts "#{k}: £#{v}" } 
  end
end
