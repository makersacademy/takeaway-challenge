class Menu

  def initialize
    @items = { 'Pepperoni' => 1,
              'Hot Shot' => 1,
              'Jardin' => 2,
              'Provencale' => 2,
              'Roquefort' => 3,
              'Neptune' => 3,
              'Poulet' => 4,
              'Four Seasons' => 4 }
  end

  def contains?( name)
    @items.has_key?(name)
  end

  def price( name)
    self.contains?(name) ? @items[name] : 0
  end

  def to_s
    @items.each { |pizza, price| puts "#{pizza}  £#{price}"}
  end
end