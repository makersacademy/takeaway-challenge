# understands how to present menu for user

class MenuPrinter
  attr_reader :printed_menu

  def initialize(menu)
    @printed_menu = [menu[0]]
    nice_print(menu)
  end

  private

  def nice_print(menu)
    menu[1..menu.count].each_with_index do |item, index|
      make_nice_string(item, index)
      @printed_menu << @nice_string
    end
  end

  def make_nice_string(item, index)
    food = item.keys.join
    price = item.values.join
    @nice_string = "#{(index + 1).to_i}. #{food} (£#{'%.2f' % price})"
  end

end
