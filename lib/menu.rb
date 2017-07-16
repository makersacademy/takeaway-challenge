class Menu

  attr_reader :items, :order
  attr_accessor :item, :number

  def initialize
    @items = {'Mushrooms' => 3, 'Broccoli' => 2, 'Beans'=> 3, 'Canneloni' => 5, 'Sushi roll'=> 6}
  end

  def display
    items.each.with_index {|(k,v),index| puts "#{index + 1}. #{k}: £#{v}"}
  end

end
