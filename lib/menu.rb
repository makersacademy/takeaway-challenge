class Menu

  attr_reader :dishes

  def initialize
    @dishes = Hash[:salmon, 2, :tuna, 3, :egg, 1.5,
                   :squid, 1.8, :scallop, 2.8]
  end

  def show_menu
    'Thank you for checking out our restaurant. Here is our menu:'
    dishes.each { |food, price| puts "#{food}: £#{price}" }
    'Please take your time.'
  end
end
