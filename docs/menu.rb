class Menu
  attr_reader :items

  def initialize
    @items = {
      "1. King's Fired Rice" => 88,
      "2. Secret Roast Goose" => 322,
      "3. Sorrowful Rice" => 696,
      "4. Buddha Jumping Wall" => 122,
      "5. Beef Balls" => 155,
      "6. Pissing Shrimp" => 162,
      "7. Pissing Beef Balls" => 299 }
  end

  def display
    @items.each { |k, v| puts "#{k} £#{v}" }
  end
end
