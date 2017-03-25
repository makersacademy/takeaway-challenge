class Menu
  attr_reader :dishes

  def initialize(dishes:)
    @dishes = dishes
  end

  def show_menu
    dishes.map do |name, price|
      "%s - £%.2f" % [name.to_s.gsub("_", " "), price]
    end
  end

end
