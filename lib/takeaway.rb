class Takeaway

  @menu = [
    { 'California Roll' => 5.00 },
    { 'Chicken Gyoza' => 4.50 }, 
    { 'Sashimi Salad' => 3.50 },
    { 'Katsu Curry' => 7.50 },
    { 'Miso Soup' => 2.50 },
    { 'Tokyo Ramen Noodles' => 4.00 },
    { 'Bento Box' => 6.50 },
  ]

  def print_menu
    @menu
  end
end
# #   attr_reader :menu

# #   def initialize(menu)
# #     @menu = menu
# #   end

#   def print_menu
#     # menu.print
#   end


