

class Menu
  attr_reader :menu

  def initialize
    @menu = { krabby_patty: 1.25, salty_sea_dog: 1.25, sailors_surprise: 3.00, coral_bits: 1.00, kelp_rings: 1.50 }
  end

  def list_dishes
    @menu.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end

  def contains?(dish)
    @menu.has_key?(dish)
  end

end
