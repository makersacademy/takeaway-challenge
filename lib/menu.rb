require 'json'
class Menu
  attr_reader :menu
  def initialize
    file = File.read(File.expand_path("../../menu.json", __FILE__))
    @menu = JSON.parse(file)
  end

  def create_menu
    i = 1
    while i <= menu.length
      dish = menu[i.to_s]['dish']
      price = menu[i.to_s]['price']
      puts "#{i}. #{dish} - £#{price}"
      i += 1
    end
  end
end

# p menu = Menu.new
# p menu.create_menu
