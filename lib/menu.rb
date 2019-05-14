class Menu
attr_reader :view_all

  def initialize
    @options = {
      "1. Curry" => 8.50,
      "2. Fish & Chips" => 7.20,
      "3. Pizza" => 12.30
    }
  end

  def view_all
    @options.each do |dish, price|
      "#{dish}: £#{price}"
    end
  end
end
