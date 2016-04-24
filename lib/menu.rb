class Menu < Hash

  def initialize
  self.store(:pizza_deluxe, 15.00)
  self.store(:salad, 10.00)
  self.store(:hamburger, 12.00)
  self.store(:chicken_tikka_masala, 15.50)
  self.store(:curry, 14.50)
  end

end
