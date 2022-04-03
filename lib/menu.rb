class Menu
  attr_reader :menu_hash
  
  def initialize(menu_hash)
    @menu_hash = menu_hash
  end

  def display
    @menu_hash.map do |key, value|
      "#{key}, £#{value}0"
    end
  end
end
