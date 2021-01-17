class Restaurant

  MY_RESTAURANT = "Tasty Tuck"

  def self.initialize(name = MY_RESTAURANT)
    @@name = name
  end

  def self.load_menu
  end
end
