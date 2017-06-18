require_relative 'order.rb'

class Menu
  attr_reader :list, :menu_name

  def initialize(menu_name = './docs/menu.txt')
    @menu_name = menu_name
    @list = []
    save_menu(menu_name)
  end

  def read_menu(menu_name = './docs/menu.txt')
    IO.foreach(menu_name) { |x| puts x }
  end

private
  def split_menu_line(str)
    item_index = str.index(/\D/)
    currency_index = str.index("£")
    { item: str[0..item_index - 1].to_i, name: str[item_index..currency_index - 1].to_sym, price: str[currency_index + 1..-1].to_f }
  end

  def save_menu(menu_name = './docs/menu.txt')
    IO.foreach(menu_name) do |x|
      @list << split_menu_line(x)
    end
  end

end
