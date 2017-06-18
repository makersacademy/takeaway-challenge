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

    it 'shows the order info and places order' do
      subject.place_order
      allow(subject.message).to receive(send_message: true)
      allow(subject.new_order).to receive(:calculate_total) { 29.97 }
      expect(subject.new_order).to receive(:view_basket)
      subject.place_order
    end
  end

end
