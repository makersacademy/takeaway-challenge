
class Order

attr_reader :total_order

def initialize
@total_order = []
end

def add(input)
  order = input.split(" ")
  if order[1].nil?
     @total_order << order[0]
  else
    (order[1].to_i).times do
      @total_order << order[0]
    end
  end
end

end
