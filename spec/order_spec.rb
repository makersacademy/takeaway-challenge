require 'order'
describe Order do
  let (:order) {Order.new}
  it { is_expected.to respond_to :create_order }

  context "the Adder" do

    it 'takes in an item and returns the cost' do
      expect(order.adder([["Chop Suey", 1]])).to eq 7.00
    end

    it 'takes in two items and returns the cost' do
      expect(order.adder([["Chop Suey", 1], ["Dim Sum", 2]])).to eq 20.00

    end

  end

  context 'creating the order' do

    it 'takes in multiple items and agrees with the customers cost' do
      expect(order.create_order(["Spare ribs", 3],["Duck Chow Mein", 1], 34.50)).to eq true
    end

  end

  context 'printing the receipt' do
    it { is_expected.to respond_to :print_receipt}

    it "should return a detailed receipt if the cost is as expected" do
      expect(order.print_receipt([["Spare ribs", 3],["Duck Chow Mein", 1]],34.50)).to eq "Thank you for ordering
You ordered:
Item: Spare ribs, total cost 27.00
Item: Duck Chow Mein, total cost 7.50
Total cost: 34.50"
    end

  end

  context 'send text' do

    it "should take phone number and send a message" do

      expect(subject.send_text(18.00)).to eq true

    end

  end
end
