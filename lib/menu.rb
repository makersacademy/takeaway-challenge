class Menu

  attr_reader :menu_hash

  def initialize
    @menu_hash = {
      "pizza" => 5,
      "fish" => 7,
      "chips" => 2,
      "kebab" => 5,
      "curry" => 7}

  end

  def display
    @menu_hash.each do |key, value|
      puts "#{key} - £#{value}"
    end
  end
end
