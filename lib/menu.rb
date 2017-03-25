class Menu
# class responsible for loading and showing menu

attr_reader :menu

  def initialize
    @menu = []
  end

  def open
    load_menu
    menu.each_with_index do |menu, index|
      puts "#{index + 1}. #{menu[:item]}, £#{menu[:price]}"
    end
  end

private

attr_writer :menu

  def load_menu(filename = "./lib/menu.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      item, price = line.chomp.split(',')
      @menu << {item: item, price: price}
    end
    file.close
  end

end
