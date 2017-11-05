require '/Users/marcovanali/Desktop/Projects/Weekend_Challenges/takeaway-challenge/lib/twiliosms.rb'
require '/Users/marcovanali/Desktop/Projects/Weekend_Challenges/takeaway-challenge/lib/takeaway_logo.rb'

class Restaurant

  def initialize
    @list = [[:Pizza, 12], [:Patatine, 4], [:CocaCola, 3], [:Lasagne, 4], [:Polenta, 3]]
    @dishes_choosen = []
    @user_interface = Takeaway_logo.new
  end

  def show_menu
    @user_interface.menu_header
    @list.each_index { |num| puts "#{num + 1}. #{@list[num][0]} = £#{@list[num][1]}" }
  end

  def food_and_quantity
    puts "Please write the number of the first dish you want to order. Then press Enter."
    dish = gets.chomp
    while dish != ""
      puts "Write a number to indicate how many portion you wish."
      portions = gets.chomp
      @dishes_choosen << [dish.to_i, portions.to_i]
      puts "Write the number of the next dish. If you've finish just press Enter."
      dish = gets.chomp
    end
  end

  def select_dishes
    puts "Your basket:"
    @dishes_choosen.each do |food|
      food[0] -= 1
      puts "#{food[1]} #{@list[food[0]][0]}"
    end
  end

  def payment_message
    @prices = []
    @dishes_choosen.each { |dish| @prices << (@list[dish[0]][1]) * (dish[1]) }
    puts "Total to pay: £#{@prices.reduce(:+)}"
  end

  def user_payment
    puts "PAYMENT:"
    @money = 0
    while @money != @prices.reduce(:+)
      puts "Please insert the amount of money:"
      @money = gets.chomp.to_i
      payment_error
    end
    conferm
  end

  def payment_error
    puts "Sorry the amount it's not correct." if @money != @prices.reduce(:+)
  end

  def conferm
    puts "Thanks your order has been accepted. Shortly you will receive an confirmation by sms."
  end

  def conferm_sms
    Twiliosms.new.send_conferm_sms
  end

end
