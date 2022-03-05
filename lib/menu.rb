class Menu
  MENU = [
    { dish: 'kimchi pancake', price: 5.99 },
    { dish: 'tteokbokki', price: 7.99 },
    { dish: 'kimchi-jjigae', price: 12.99 }
  ]

  attr_reader :basket

  def initialize
    @menu = MENU
    @basket = []
  end

  def see
    @menu.each { |item| puts "#{item[:dish]}: #{item[:price]}" }
  end

  def select(item, amount)
    amount.times { @basket << item }
  end
end
