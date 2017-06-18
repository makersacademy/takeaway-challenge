require "./lib/takeaway.rb"

describe Takeaway do

  describe '#initialize' do
    it 'should create a new order' do
      expect(subject.new_order).to be_instance_of(Order)
    end
  end

  describe '#place_order' do
    before do
      subject.new_order.select_item(1)
      subject.new_order.select_item(2)
      subject.new_order.select_item(3)
      subject.new_order.view_summary
    end

    it 'raises an error if the total price is incorrect' do
      allow(subject.new_order).to receive(:total) { 10.00 }
      expect { subject.place_order }.to raise_error "order total is not correct"
    end

    # it 'gives an order confirmation' do
    #   subject.place_order
    #   expect(STDOUT).to receive(:puts).with("Your order has been placed successfully! You will receive an SMS with your order time.")
    # end
  end
end
