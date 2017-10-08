class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = []
    load_menu
  end

  def view_menu
    "Menu:\n" + menu_formatter
  end

  private

  def load_menu
    File.open(File.dirname(__FILE__) + '/../menu/menu.txt') do |file|
      file.each do |line|
        @menu_items << {item_num:  line.split(",")[0].to_i,
                        item:       line.split(",")[1],
                        cost:       line.split(",")[2].chomp.to_f}
      end
    end
  end

  def menu_formatter
    menu_items.map {|item| "#{item[:item_num]}) #{item[:item]} - £#{'%.2f' % item[:cost]}\n"}.join.chomp
  end

end
