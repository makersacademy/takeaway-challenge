class Order
  attr_reader :total

  def initialize
    @selected_dishes = {}
    @total = 0
  end

  def start_order
    @list = Takeaway::LIST
    puts 'Type the dish name, close to end'
    loop do
      dish = gets.chomp.to_sym
      if @list.include?(dish)
        puts 'Quantity ?'
        quantity = gets.chomp.to_i
        @selected_dishes[dish] = quantity
        @total += (@list[dish] * quantity)
      elsif dish == :close
        break
      else
        puts 'The dish is not in the menu'
      end
      puts 'Next dish'
    end
    @selected_dishes
  end

end
