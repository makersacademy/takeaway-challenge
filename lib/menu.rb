class Menu

  def initialize
    @menu = {
      "Fish" => 2365,
      "Chips" => 1836,
      "Kebab" => 4317
    }
  end

  def list
    @menu.map { |name, price| "#{name}: £#{price}" }
  end

end
