class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(dish)
    @basket.push(dish)
  end

  def view_basket
    @basket.each do |element|
      puts "#{element["Name"]} : £#{element["Price"]}"
    end
    puts "\nNumber of items: #{@basket.count}"
    puts view_total
  end

  private

  def view_total
    sum = @basket.map do |element|
      element["Price"].to_i
    end.reduce { |total, price| total + price}
    puts "Total cost: £#{sum}"
  end

end