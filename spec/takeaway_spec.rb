require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }
  let(:phone) { double :phone }

  context '#initialize' do
    it 'should start with an empty order' do
      expect(takeaway.order).to be_empty
    end
  end

  context '#dish_order' do
    it 'should store the order' do
      takeaway.dish_order(:pizza, 3)
      expect(takeaway.order).to include(:pizza)
    end

    it 'should raise an error if not on the list' do
      message = "Sorry, that dish isn't on the menu"
      expect { takeaway.dish_order("something", 3) }.to raise_error message
    end

  end

  context '#order_amount' do
    it 'should calculate the total order amount' do
      takeaway.dish_order(:pizza, 2)
      takeaway.dish_order(:pizza, 2)
      expect(takeaway.order_amount).to eq 10
    end
  end

  context '#send_order' do
    it 'should not send an order if exact amount != order_amount' do
      allow(takeaway).to receive(:order_amount) { 30 }
      allow(takeaway).to receive(:exact_total).and_return(31)
      message = 'Exact amount... yeah right!'
      expect { takeaway.send_order }.to raise_error message
    end
  end

end
