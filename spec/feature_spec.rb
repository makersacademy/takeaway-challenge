# Chicago style
# unit test on Takeaway mainly redundant as _
# Takeaway class mostly calls other classes

require 'takeaway'

describe Takeaway do
  context 'generated with a Test menu' do

    let(:menu) { double :menu, menu: [{ 'Test' => 1.5 }] }
    let(:printer) { double :printer }

    test_takeaway = described_class.new('Test')

    describe 'Menu creation' do
      it 'can get a #menu' do
        expect(test_takeaway.takeaway_menu).to eq [{ 'Test' => 1.50 }]
      end

    end

    describe '#order' do
      it 'adds an item to the basket' do
        2.times { test_takeaway.order(1) }
        expect(test_takeaway.basket.current_order).to eq [{ 'Test' => 1.5 }, { 'Test' => 1.5 }]
      end
    end

    describe '#checkout' do
      it 'fails if basket is empty' do
        expect { subject.checkout }.to raise_error 'You have nothing in your basket'
      end
    end

    describe '#pay' do
      it 'checks that the total and amount paid match' do
        expect { test_takeaway.pay(0) }.to raise_error 'You have paid the wrong amount.'
      end
    end

  end
end
