class Cart

attr_accessor :contents
attr_reader :total

  def initialize
    @contents = []
  end

  def total
    @total = contents.collect { |item| item[:price] }
    @total.sum
  end

  def format_contents
    puts "Your cart: "
    contents.each do |item|
      puts "Item: #{item[:item]}" + "Price: #{item[:price]}".rjust(30 - (item[:item].length) )
    end
    puts "Total: #{self.total}".rjust(36)
  end

end
