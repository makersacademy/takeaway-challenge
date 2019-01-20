require_relative 'order'

class Takeaway
  attr_reader :menu

    def initialize
      @menu = { "Tofish Bites": 6,
        "Seitan Fried Chikken Wings": 6,
        "Mac and Cheeze": 4.50,
        "Loaded Fries": 9,
        "The Moving Mountains Burger": 12,
        "Surf and Turf Hot Dog": 10,
        "Veganuary Club Sandwich": 10,
        "Cherry Pie": 6.50,
        "Baked Cheezecake": 6.50 }
    end

  def read_menu
    puts @menu
  end
end
