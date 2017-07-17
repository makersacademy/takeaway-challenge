class Menu

  attr_reader :items, :order
  attr_accessor :item, :number

  def initialize
    @items = { 'mushrooms' => 3, 'broccoli' => 2, 'carrots' => 2, 'beans'=> 3, 'canneloni' => 5, 'sushi roll'=> 6 }
  end

  def display
    items.each.with_index { |(k, v), index| puts "#{index + 1}. #{k.capitalize}: £#{v}" }
  end

end
