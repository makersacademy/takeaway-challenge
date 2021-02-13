require_relative './checkout.rb'

class Takeaway
  attr_reader :menu, :basket

  def initialize
    @menu = {
      'bibimbap'=>10.50,
      'bulgogi'=>10,
      'naengmyeon'=>8
    }
    @basket = [{:item => nil, :quantity => nil, :total_price => nil}]
  end

  def add_to_basket(item, quantity)
    @basket.push({:item => nil, :quantity => nil, :total_price => nil}) if @basket.size < 1
    self.menu.map do |food, price|
      if item == food
        @basket.last[:item]=item
        @basket.last[:quantity]=quantity
        @basket.last[:total_price]=(price*quantity)
      end
    end
    puts "#{item}(s) x#{quantity} was added to your basket"
  end

    # problem is to get the prices to add the total.
    # Could I add a string of items and quantity as one item, and float as price?
    # @basket.last['item'] = 'bulgogi'



    # @basket.scan(/\d+/).map(&:to_i)




 # multiple array items
 # for each array item, isolate the price
 # change it to a float
 # add it together


  #  if price.to_s.split('.').last.size == 1
  #    @basket.last << '0'
  #  end
  #

  # my_basket.map {|item| .inject}

end
