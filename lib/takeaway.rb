class Takeaway

  attr_reader :menu

  def initialize
    @menu = {"starter" => 5, "mains" => 10, "desert" => 3}
  end

  def show_dishes
    print "starter : 5\nmains : 10\ndesert : 3\n"
  end

  def order(*dishes)
    dishes.pop
    order_hash = Hash[*dishes]
    order_hash.each do |k, v|
      fail "Unable to place order: dish not on menu" unless @menu.has_key?(k)
    end
  end

end
