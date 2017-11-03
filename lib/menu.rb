class Menu

  def initialize
    @list = [[:Pizza, 12], [:Patatine, 4], [:CocaCola, 3], [:Lasagne, 4], [:Polenta, 3]]
  end

  def show_menu
    @list.each_index do |num|
      puts "#{num + 1}. #{@list[num][0]} = £#{@list[num][1]}"
    end
  end

  def select_dishes(*dishes)
    @dishes = dishes
    @dishes.each { |dish| puts "#{@list[dish][0]}(£#{@list[dish][1]})" }
  end

  def payment_message
    @prices = []
    @dishes.each do |dish|
      @prices << @list[dish][1]
    end
    puts "You have to pay £#{@prices.reduce(:+)}"
  end

end
