class Takeaway
  attr_accessor :dishes, :order

  def initialize
    @dishes = {
      "Beef Wellington" => 10.50,
      "Crab Pappardelle Arrabbiata" => 8.25,
      "Duck à L'Orange" => 9.75,
      "Sweet & Sour Pork" => 7.00,
      "Miso Steak" => 8.75,
      "Beef Bourguignon" => 10.50,
      "Salt & Pepper Squid" => 9.25,
    }
    @order = []
  end

  def menu
    @dishes.each do |dish, price|
      print "#{dish} : £#{price}\n"
    end
  end

  def choose(food)
    @dishes.each do |dish, price|
      if food.include?(dish)
        @order << "#{dish} - £#{price}"
      end
    end
  end
end
