require 'calculate'
describe Calculate_Order do

  let (:including_class){ Class.new { include Calculate_Order} }

  test_menu = {:Hamburger => 4.50, :Chips => 1}
  test_order = [[:Hamburger, :Chips],[1,2]]
  test_order_list = [[:Hamburger, :Chips],[1,2],[6.50]]

  describe '#check_calculation'do
    it 'checks to see whether the expected value is the same as the calculated'do
      expect(including_class.new.check_calculation(test_order_list, test_menu)).to eq true
    end
  end
    describe '#calculate'do
      it 'calculates the price of an order'do
      expect(including_class.new.calculate(test_order, test_menu)).to eq 6.50
    end
  end
end
