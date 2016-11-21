require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, sms) }
  let(:menu) { double(:menu) }
  let(:item) { double(:item) }
  let(:unavailable_item) { double(:unavailable_item) }
  let(:expected_total) { double(:expected_total) }
  let(:sms) { double(:sms) }

  before do
    allow(menu).to receive(:new).and_return menu
    allow(menu).to receive(:print_menu)
    allow(sms).to receive(:new).and_return sms
    allow(sms).to receive(:send_confirmation)
  end

  context 'when ordering' do
    before(:each) do
      allow(menu).to receive(:has_item?).with(item).and_return(true)
    end

    it 'adds your chosen item to items' do
      takeaway.add_item(item, 1)
      expect(takeaway.items.empty?).to eq false
    end

    it 'if no quantity is given the default quantity of 1 will be given' do
      takeaway.add_item(item)
      expect(takeaway.items.has_value?(1)).to eq true
    end

    it 'increments the quantity of the item if the same item has been added more than once' do
      takeaway.add_item(item, 1)
      takeaway.add_item(item, 1)
      expect(takeaway.items.has_value?(2)).to eq true
    end

    context 'raising errors if item or quantity invalid' do
      it 'raises an error if quantity is less than 1' do
        allow(menu).to receive(:has_item?).with(item).and_return(true)
        expect { takeaway.add_item(item, -10) }.to raise_error('Quantity cannot be less than 1')
      end

      it 'raises an error if you try to add something that is not on the menu' do
        allow(menu).to receive(:has_item?).with(unavailable_item).and_return(false)
        expect { takeaway.add_item(unavailable_item, 1) }.to raise_error('This item is not on the menu, please choose something else')
      end
    end

    context 'calculating total for order' do

      before do
        allow(menu).to receive(:dishes).and_return({item => 3})
        allow(menu).to receive(:has_item?).with(item).and_return(true)
        takeaway.add_item(item, 1)
      end

      it 'shows the correct total' do
        expect(takeaway.show_total).to eq 3
      end

      it 'allows you to pay by accepting the expected total' do
        expect{ takeaway.pay(3) }.not_to raise_error
      end

      it 'raises an error if the incorrect total is entered' do
        allow(takeaway).to receive(:total).and_return(1)
        expect { takeaway.pay(2) }.to raise_error('This is the incorrect total, please try again')
      end
    end

    context 'sending a text confirmation' do
      before do
        allow(menu).to receive(:dishes).and_return({item => 3})
        allow(menu).to receive(:has_item?).with(item).and_return(true)
        takeaway.add_item(item, 1)
      end

      it 'sends a text confirmation' do
        expect(takeaway.pay(3)).to eq 'Your order has been received and you will receive a text confirmation shortly'
      end
    end
  end
end
