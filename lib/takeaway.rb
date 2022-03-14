class Takeaway
  attr_reader :menu_items

  def initialize
    @menu_items = {
      '1. Sunset Burger' => 8.25, 
      '2. Grilled Chicken Wrap' => 6.75, 
      '3. Double Chicken Wrap' => 9.95,
      '4. Grilled Chicken Burger' => 6.75,
      '5. Double Chicken Burger' => 9.95,
      '6. Grilled Chicken Pitta' => 6.75,
      '7. Double Chicken Pitta' => 9.95,
      '8. Imitator Wrap' => 6.75,
      '9. Imitator Burger' => 6.75,
      '10. Imitator Pitta' => 6.75
    }
  end

  def menu
    puts "Here is our menu: "
    @menu_items.each do |k, v|
      puts "#{k}: £#{v}"
    end
  end

end
nandos = Takeaway.new
nandos.menu