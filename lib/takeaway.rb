require_relative 'menu'
require_relative 'texting'

class TakeAway
  attr_reader :order_final
  attr_reader :total_cost

  def initialize(menu_class = Menu.new, texting_class = Texting.new)
    logo
    @menu_class = menu_class
    @texting_class = texting_class
    @order_final = []
    @total_cost = 0
  end

  def select_dish(dish_name)
    @menu_class.find_dish(dish_name).each do |item|
      @order_final << item
      @total_cost += item[:price]
    end
  end

  def see_menu
    menu_header
    @menu_class.print_menu
  end

  def order_list
    order_list_header
    @order_final.select do |items|
      puts "#{items[:dish]} --- £#{items[:price]}"
    end
    order_total
  end

  def bill
    @total_cost
  end

  def complete_order
    @texting_class.send_text
  end

  private

  def menu_header
    puts 'Welcome to the Enchanted Takeaway'
    puts '---------------------------------'
  end

  def order_list_header
    puts 'Your order:'
    puts '----------------'
  end

  def order_total
    puts '----------------'
    puts "Total payable --- £#{bill}"
  end

  def logo

    puts "   ```"
    puts "                        _________"
    puts "          r==           |       |"
    puts "       _  //            |  B.P. |   ))))"
    puts "      |_)//(''''':      |       |"
    puts "        // \\_____:_____.-------D     )))))"
    puts "       //   | ===  |   /       \\ "
    puts "   .:'//.  \\\\=|  \\ /  .:'':./    )))))"
    puts "  :' // ':  \\\\ ''..'--:'-.. ':"
    puts "  '. '' .'   \\:.....:--'.-'' .'"
    puts "   ':..:'                ':..:'"
    puts ""
    puts "```"

  end

end
