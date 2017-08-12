class Menu
  attr_reader :items

  def initialize
    @items = {
      "King's Fired Rice" => 88,
      "Secret Roast Goose" => 322,
      "Sorrowful Rice" => 696,
      "Buddha Jumping Wall" => 122,
      "Beef Balls" => 155,
      "Pissing Shrimp" => 162,
      "Pissing Beef Balls" => 299 }
  end

  def display
    @items.each { |k, v| puts "#{k} £#{v}" }
  end
end
