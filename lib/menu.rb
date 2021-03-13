class Menu
  def initialize
    @menu = TEST_MENU
  end

  def display_menu
    display_menu_format
  end

  def access
    @menu
  end

  private

  def display_menu_format
    display = ['MENU']
    @menu.each_with_index { |item, index| display << menu_line_format(item, index) }
    display.join("\n")
  end

  def menu_line_format(item, index)
    "#{index + 1}. #{item.flatten[0]}  Price: £#{gbp_format(item.flatten[1])}"
  end

  def gbp_format(amount)
    sprintf('%<gbp>.2f', gbp: amount)
  end
end

TEST_MENU = [
  { 'Spicy Edamame' => 4.20 },
  { 'Salt and Chilli Vat Chicken Strips' => 5.20 },
  { 'Tempura Seaweed Fish' => 8.00 },
  { 'Space Whale Sashimi' => 16.00 },
  { 'Venerable Dragon Roll' => 9.80 }
]
