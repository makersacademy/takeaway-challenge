class Order

  def initialize
    @menu
  end

  def view_menu
      @menu = [
        { :dish => "dinosaur eggs", :price: => 3.0 },
        { :dish => "golden bones", :price => 10.0 },
        { :dish => "calamari milkshake", :price => 8.0 },
        { :dish =>  "durian gazpacio", :price => 8.0 },
        { :dish => "flakey teeth", :price => 8.0 }
      ]
      puts @menu
    end
end
