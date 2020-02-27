class Menu
  attr_reader :menu
  def initialize
    @menu = {
      "Pasta" => 6,
      "Pizza" => 9,
      "Hamburger" => 10,
      "Steak" => 20
    }
  end

  def list
    @menu.each { |item, price| puts "#{item} - £#{price}" }
  end
end
