
class Order

attr_reader :total_order

def initialize
@total_order = []
end

def add(item, number = 1)
  if number != 1
    number.times do
      @total_order << item
    end
  else
    @total_order << item
  end
end

end