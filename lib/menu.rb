require 'csv'

class Menu

  attr_reader :items

  def initialize(item = Item, formatmenu = FormatMenu, csv = './lib/menu.csv')
    @items = {}
    @item = item
    @formatmenu = formatmenu
    
    CSV.read(csv)[1..-1].each_with_index do |row, index|
      @items[index + 1] = @item.new([index + 1] + row)
    end
  end

  def select(id)
    return nil unless @items.keys.include?(id)
    @items[id]
  end

  def print_menu
    puts @formatmenu.new(@items).lines
  end

end
