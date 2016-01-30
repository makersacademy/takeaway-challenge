require 'calculate'
describe Calculate_order do

  let (:including_class){ Class.new { include Calculate_order} }

  test_menu = {:Hamburger => 4.50, :Chips => 1}
  test_order_list = [[:Hamburger, :Chips],[1,2],[6.50]]

  describe '#calculate'do
    it 'checks to see whether the expected value is the same as the calculated'do
      expect(including_class.new.calculate(test_order_list, test_menu)).to eq true
    end
  end
end
