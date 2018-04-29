class Takeaway

  attr_reader :menu, :basket

  def initialize
    @basket = Basket.new
    @menu = { potato_smilies: 2,
              turkey_twizzlers: 3,
              rice_pudding: 3,
              panda_pop: 1,
              spaghetti_hoops: 1
            }
  end

end
