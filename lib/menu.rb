class Menu

  def initialize
    @basket = []
  end

  def show_menu
    @menu = { "dishes" => "price",
    "Tortellini skewers" => 4,
    "Asparagus and mozerella parcels" => 5,
    "Spagetti Carbonara" => 8,
    "Margharita Pizza" => 7,
    "Selection of Icecream" => 3 }
      @menu.each do |dish, price|
        puts "#{dish}: #{price}"
      end
  end

  def add_to_basket
    @user = gets.chomp
    @menu.each do |dish, price|
      if dish == @user
        puts "How many orders of this dish would you like?"
        @amount = gets.chomp
        puts @basket.push(["#{@amount} orders of:", "#{dish},", "Total Price:", price * @amount.to_i])
      end
    end
  end

  def calculate_total
    total = []
    @basket.each do |orders|
      total << orders[3]
    end
    puts "The total of your order is £#{total.sum}"
  end
end
