class Order

attr_accessor :customer_order, :menu

  def initialize
    @customer_order = {}
    @menu = Menu.new
    get_order
  end

  def get_order
    puts 'What would you like to order?'
    puts "To finish, just press enter twice"
    @dish = gets.chomp
    until @dish.empty? do
      puts "How many #{@dish}'s would you like"
      qty = gets.chomp.to_i
      @total = @menu.full_menu[@dish].to_i * qty
      @customer_order.merge!(:dish => @dish, :qty => qty, :total => @total)
      puts "Next dish"
      @dish = gets.chomp
    end
  end



end
