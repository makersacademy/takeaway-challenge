class Menu
  attr_reader :contents
  def initialize
    @contents = [{food: :Chips, price: 1}, 
      {food: :Tofu, price: 2}, {food: :Broccoli, price: 1}, 
      {food: :Ice_cream, price: 2}]
  end

  def show
    @contents.each_with_index do |item, index| 
      puts "#{index+1}. #{item[:food]} - £#{item[:price]}"
    end
  end

end

