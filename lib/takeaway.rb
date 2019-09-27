require_relative ('text')


class Takeaway

  attr_accessor :order

  def initialize
    @menu = ['chips' => 2.00, 'snackbox' => 3.50, 'battered sausage' => 1.50,
      'curry sauce' => 1.00, 'battered cod' => 3.00]
      @ordered_items = []
    end

    def menu
      @menu
    end

    def order(item, quantity)
      x = 0
      while x < quantity do
        @ordered_items << item
        x += 1
      end
      return @ordered_items
    end

    def cost_of_order
      y = []
      @ordered_items.each do |n|
        y << @menu[0][n]
      end
      y = y.inject(:+)
      y = ('%.2f' % y)
      return ("£" + y.to_s)
    end

    # A LESS WEIRD WAY OF PHRASING USER STORY 3, BUT REALLY TESTS THE SAME THING
    def pay(card_payment)
      raise 'payment does not reach total' if card_payment != cost_of_order
      text
      return 'payment processed'
    end

    def text
      Text.new
    end
end
