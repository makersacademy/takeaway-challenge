require_relative 'printmenu.rb'
require_relative 'printbasket.rb'
require_relative 'order.rb'

class UserInterface
  def initialize(menu,
    basket
    )
    @menu = menu
    @basket = basket
    @printmenu = PrintMenu.new
    @printbasket = PrintBasket.new
    @order = Order.new
  end

  def see_menu
    print(@printmenu.print(@menu))
    #call it FormatMenu.to_s
  end

  def add_to_basket(item)
    case input_type(item)
      when :integer then @basket.add(@menu.lookup.by_number(item.to_i))
      when :string then puts @basket.add(@menu.lookup.by_name(item))
    end
    return @basket.contents
  end

  def remove_from_basket(item)
    @basket.remove(@menu.lookup.by_name(item))
  end

  def see_basket
    print @printbasket.string(@basket)
  end

  def place_order
    see_basket
    puts "Is this correct? (y/n)"
    @order.place_order(@basket) if gets.chomp.downcase == 'y'
    exit
  end

  private

  def input_type(input)
      return :string if input.to_i == 0
      return :integer
  end
end
