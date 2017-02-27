require 'total'
require 'order'

describe Total do
  subject(:total) {described_class.new}

    it "raises an error if not equal to user's total" do
      order = Order.new
      order.choose_dishes([1, 2], [2, 2], 0)
      expect{total.check}.to raise_error "Total incorrect. Please re-calculate."
    end

    it "prints the order to the screen" do
      order = Order.new
      expect{order.choose_dishes([1, 2], [2, 2], 15)}.to output("2 x Tandoori Chicken = 7.0\n2 x Lamb Madras = 8.0\nTotal = 15.0\nIs this correct? (y | n)\n").to_stdout
    end

end
