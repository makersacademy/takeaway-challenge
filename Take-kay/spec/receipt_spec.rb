require 'receipt'

describe Receipt do
  subject(:receipt) { described_class.new }
  let(:fake_order) {double("fake_order", current_order: {"wing" => 5, "banana" => 5})}



  describe 'receipt' do
    # it 'it should take a fake order and return the item subtotals' do
    #   expect(receipt.receipt(fake_order)).to eq "wing x5 : £4.95"
    # end

    it 'should take an order and return add it to the item subtotals' do
      order = Order.new
      order.order("wing", 1)
      order.order("banana", 1)
      receipt.receipt(order)

      expect(receipt.item_subtotals).to eq ["wing x1 : £0.99", "banana x1 : £30.33"]
    end

  describe 'total_price' do
    it 'should return the total price to 2 dp' do
      order = Order.new
      order.order("wing", 1)
      order.order("banana", 1)
      receipt.receipt(order)
      expect(receipt.total_price.round(2)).to eq 31.32
    end
  end

    describe 'check_total' do
      it 'should allow me to check my total against the provided total' do
        order = Order.new
        order.order("wing", 1)
        order.order("banana", 1)
        receipt.receipt(order)
      expect(receipt.check_total(31.32)).to eq "The total is correct."
    end
  end



  end

end
