class Basket
  attr_reader :contents
  def initialize
    @contents = []
  end

  def add(item, quantity)
    quantity.times { @contents << item }
  end

  #Follow up with coach: how to best split out the reformatting of the hash from this method/
  #is it ok for it to just live there
  def view
    h = Hash.new 0
    @contents.each {|p| h[p] += 1}
    @contents = h.keys.map{|k| k[:count] = h[k]; k}
    @contents.each do |item|
      price = item[:price] * item[:count]
      puts "#{item[:pizza]} x#{item[:count]}, £#{price}"
    end
  end

  def total 
    sum = 0
    @contents.each do |item|  
      sum += item[:price]
    end
    return (sum)
  end
end

# b = Basket.new
# b.add({:pizza => "n", :price => 12}, 3)
# b.add({:pizza => "m", :price => 2}, 15)
# b.total
# sum += item[:price]