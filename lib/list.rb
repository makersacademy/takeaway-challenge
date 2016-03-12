class List
attr_reader :dishes

def initialize(dishes)
	@dishes = dishes
end

def display
	dishes.map do |name, price|
		"%s £%.2f" % [name.to_s.capitalize, price]
	end.join(", ")
end

 def has_dish?(dish)
    !dishes[dish].nil?
 end

  def price(dish)
    dishes[dish]
  end

end