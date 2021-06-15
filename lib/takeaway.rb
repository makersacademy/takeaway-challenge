class Takeaway
  attr_reader :menu_items

  def initialize
    @menu_items = {
      'Sunset Burger' => 8.25, 
      'Grilled Chicken Wrap' => 6.75, 
      'Double Chicken Wrap' => 9.95,
      'Grilled Chicken Burger' => 6.75,
      'Double Chicken Burger' => 9.95,
      'Grilled Chicken Pitta' => 6.75,
      'Double Chicken Pitta' => 9.95,
      'Imitator Wrap' => 6.75,
      'Imitator Burger' => 6.75,
      'Imitator Pitta' => 6.75
    }
  end

  def menu
    @menu_items
  end

end
