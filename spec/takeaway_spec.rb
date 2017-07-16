require 'takeaway'

describe Takeaway do

  subject("takeaway") { described_class.new(order) }
  let(:order) { 'order' }
  let(:mobile_number) { '+447723456789' }

  describe '#menu' do

    it 'tells the menu to print' do
      expect { takeaway.menu }.to output("1: Burger, £5.50\n2: Pizza, £5.00\n3: Noodles, £6.00\n4: Curry, £8.00\n").to_stdout
    end
  end

  describe '#new_order' do

    it 'creates a new order' do
      takeaway.new_order(1)
      expect(takeaway.order).not_to be_nil
    end
  end

  describe '#breakdown' do

    it 'requests a breakdown from @order' do
      allow(order).to receive(:breakdown)
      allow(order).to receive(:total)
      expect(order).to receive(:breakdown)
      takeaway.breakdown
    end

    it 'returns an error if no order is placed' do
      expect { Takeaway.new.breakdown }.to raise_error "Order empty - no breakdown to display"
    end
  end

  describe '#confirm' do

    it 'returns an error if no order is placed' do
      expect { Takeaway.new.confirm(mobile_number) }.to raise_error "Order empty"
    end

    it 'changes order to nil' do
      takeaway.new_order(1)
      takeaway.confirm(mobile_number)
      expect(takeaway.order).to be_nil
    end
  end

end
