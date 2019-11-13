class Takeaway
  attr_reader :dishes
  attr_reader :order
  attr_accessor :ordered_number

  def initialize
@dishes = dishes
@order = Array.new

def dishes
@dishes =
[
  { name: "Pizza" , price: "£15.50" },
  { name: "Burger" , price: "£16.30" },
  { name: "Pasta" , price: "£14.20" },
  { name: "Sushi" , price: "£14.60" },
  { name: "Noodles" , price: "£15.20" }
]

end
end

def select(name)
  @order << name
  return @order
end

def volume
  @ordered_items = {}
@ordered_items = @order.each_with_object(Hash.new(0)) { |v, h| h[v] += 1 }

#for some reason this is causing problems by generating a value of nil.
#This is causing a problem for the next method.

  end

def total

puts @dishes.each do |x, y| puts x, y end


@dishes.each do |hash| hash.each {|k, v| v * @ordered_items[v] if @ordered_items.key? k }
# end}}
end
end
end
