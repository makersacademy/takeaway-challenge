class Menu
attr_reader :view_all

  def initialize
    @options = {
      "Curry" => 8.50,
      "Fish & Chips" => 7.20,
      "Pizza" => 12.30
    }
  end

  def view_all
    @options.each do |dish, price|
      "#{dish}: £#{price}"
    end
  end
end
