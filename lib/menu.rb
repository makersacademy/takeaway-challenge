class Menu

  attr_reader :menu

  def initialize
    @menu = [
      {"pizza" => 5},
      {"fish" => 7},
      {"chips" => 2},
      {"kebab" => 5},
      {"curry" => 7}
      ]
      
  end

  def display
    @menu.each do |list_item|
      list_item.each do |key, value|
        puts "#{key} - £#{value}"
      end
    end
  end
end
