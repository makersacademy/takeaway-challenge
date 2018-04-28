class Menu
  attr_reader :menu

  def initialize
    @menu = [{ name: 'Spring Rolls', price: 2 },
    { name: 'Popadoms', price: 2 },
    { name: 'Spare Ribs', price: 3.5 },
    { name: 'Spicy Chicken Wings', price: 2.5 },
    { name: 'Wun Tun Soup', price: 2.5 },
    { name: 'Cantonese Roast Duck', price: 4.5 },
    { name: 'Kung Po Chicken', price: 4 },
    { name: 'Shredded Beef with Chilli', price: 5 },
    { name: 'Szechuan Beef', price: 5 },
    { name: 'Cantonese Roast Pork', price: 5 }]
  end

  def list
    @menu.each do |dish|
      puts "#{dish[:name]} - £#{dish[:price]}\n"
    end
  end

end
