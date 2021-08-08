class ReadMenu
  attr_reader :menu

  def initialize(menu_class:)
    @menu = menu_class
  end

  def list_menu
    menu.items.each do |item|
      item.each { |key, value| puts "#{key} - #{value}" }
    end
  end

end