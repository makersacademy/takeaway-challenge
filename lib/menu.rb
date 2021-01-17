require 'csv'

class Menu

  attr_reader :menu

  def initialize
    @menu = []
    load_menu
    print_menu
  end

  def load_menu
    keys = [:menu_item_name, :menu_item_description, :menu_item_price, :menu_item_category]
    @menu = CSV.parse(File.open('./lib/menu.csv')).map { |a| Hash[keys.zip(a)] }
    # @menu.sort_by!{ |menu_item| [menu_item[:menu_item_category], menu_item[:menu_item_name]] }
  end

  def print_menu
    @menu.each do |menu_item|
      # puts "#{menu_item[:menu_item_name]} - £#{'%.2f' % menu_item[:menu_item_price].to_f}"
    end
  end

end
