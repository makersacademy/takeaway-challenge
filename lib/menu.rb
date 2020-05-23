# require './lib/takeaway.rb'

class Menu
  def show_menu(dishes)
    dishes.map { |key, value| "#{key} - £#{value}" }
  end
end
