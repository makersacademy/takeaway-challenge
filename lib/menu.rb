class Menu

  attr_reader :menu

  def initialize
    @menu = [ {:name => "Chicken Teriyaki", :price => 6.95},
              {:name=> "Salmon Teriyaki", :price => 7.95},
              {:name=> "Chicken Karaage", :price => 4.95},
              {:name=> "Pork Karaage", :price => 4.95},
              {:name=> "Chicken Katsu Curry", :price => 7.95},
              {:name=> "Yellow Tail Sashimi", :price => 5.95},
              {:name=> "Salmon Sashimi", :price => 5.95},
              {:name=> "Tuni Sashimi", :price => 5.95},
              {:name=> "Cucumber Maki", :price => 1.95},
              {:name=> "Miso Soup", :price => 1.50},
              {:name=> "Boiled Rice", :price => 1.95},
              {:name=> "Pickles", :price => 0.50},
              {:name=> "Hot Sake", :price => 5.75},
              {:name=> "Asahi", :price => 3.75},
            ]
  end
end
