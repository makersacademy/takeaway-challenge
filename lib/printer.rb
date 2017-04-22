# understands how to present text for user

class Printer
  attr_reader :printed_menu

  def initialize(menu)
    @printed_menu = []
    nice_print(menu)
  end

  def nice_print(menu)
    menu.each_with_index do |item, index|
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
