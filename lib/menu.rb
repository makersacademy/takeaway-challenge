class Menu

  def initialize
    @list = {:pizza => 5.00, :carbonara => 6.00, :pasta => 8.00}
  end

  def print_menu
    puts 'MENU'
    @list.each {|k,v| print("#{k} - £#{v}\n")}
  end
end
