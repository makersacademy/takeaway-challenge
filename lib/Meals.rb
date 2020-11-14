class Meals
  attr_reader :ordered
  attr_reader :dishes

  def initialize
    @ordered = []
    @dishes = [
      { meal: 'Soup', price: 1.50 },
      { meal: 'Fish and Chips', price: 3.00 },
      { meal: 'Curry', price: 3.25 }]
  end

  # prices = @ordered.map { |dish| dish[:price] }

  def menu
  #  @dishes.each do |key, value|
  #  puts "#{key} #{value}"
  # end
end
# only pushing the meal name so far :( and not the price
  # def order(meal)
  #   @dishes.find { |item| item[:meal] == meal }
  #   @ordered << meal
  # end

  # def quantity
  #   amount = @ordered.each_with_object(Hash.new(0)) {|meal, hash| hash[meal]}
  #   amount.map{|meal, quantity|}
  # end

# need to change this so it will print or put them all
  def check_order
    # @ordered.each do |key, value|
    #   puts "#{key} : #{value}"
  end


  def compare_order

  end
end
