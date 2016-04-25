class Menu
  LINEWIDTH = 40
  attr_reader :items

  def initialize
    @items = []
    menu1 = File.open('./lib/menu.txt').each_line do |line|
      menu_line = {}
      menu_line[:dish], menu_line[:price] = line.chomp.split(" £")
      @items << menu_line
    end
  end

  def display
    puts "-"*LINEWIDTH
    puts "MENU", "", "Item".ljust(LINEWIDTH/2) + "Price".rjust(LINEWIDTH/2)
    puts "----".ljust(LINEWIDTH/2)+"-----".rjust(LINEWIDTH/2), ""
    items.each do |x|
      puts x[:dish].capitalize.ljust(LINEWIDTH/2)+
        (("£"+x[:price]).rjust(LINEWIDTH/2))
    end
    puts "-"*LINEWIDTH
  end
end
