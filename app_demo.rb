require './lib/order'
class Takeaway

  attr_accessor :menu1, :order1, :name, :price, :menu_item1

  def initialize
    @menu1 = Menu.new Dish
  end


  def demo
    begin
      puts 'Takeaway Challenge'
      puts '=================='
      puts
      puts 'Select Option:'
      puts 'A - Add dish to menu'
      puts 'B - Display menu so that can make an order'
      puts 'C - Create an order'
      puts 'D - Total an order'
      puts 'X - End'
      option = gets.chomp
      case option.downcase
      when 'a'
        while true
          puts 'Add dishes name and then price (press return twice to end order )'
          @name = gets.chomp
          break if name == ''
          @price = gets.chomp
          p menu1.add_dish name, price.to_f
        end
      when 'b'
        puts "M E N U"
        puts '======='
        puts menu1.print_dishes
        puts
      when 'c'
        @order1 = Order.new menu1, Menu
        while true
          puts 'Select item number (press return twice to end order)'
          @menu_item1 = gets.chomp
          break if menu_item1 == ''
          p order1.pick_menu_item menu_item1.to_i
        end
      when 'd'
        puts "T O T A L"
        puts "=========="
        puts "Total cost of current order: £#{order1.total}"
      when 'x'
        break
      else
        puts 'choose a displayed option'
      end
    end while true
  end
end

takeaway1 = Takeaway.new
takeaway1.demo
