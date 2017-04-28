# Chicago style
# London style unit test on Takeaway mainly redundant
# Takeaway class mostly calls other classes

require 'takeaway'

describe Takeaway do
  context 'generated with a Test menu' do

    let(:menu) { double :menu, menu: [{ 'Test' => 1.5 }] }
    let(:printer) { double :printer }

    test_takeaway = described_class.new('Test')
    fake_text = FakeTextMessage.new

    describe 'Menu creation' do
      it 'can get a #menu' do
        expect(test_takeaway.takeaway_menu).to eq ["-------TEST MENU-------",
          { "Test" => 1.5 }]
      end

    end

    describe '#order' do
      it 'adds an item to the basket' do
        2.times { test_takeaway.order(1) }
        expect(test_takeaway.basket.current_order).to eq [{ 'Test' => 1.5 }, { 'Test' => 1.5 }]
      end
      it 'guards against entering item that doesnt exist' do
        expect { test_takeaway.order(3) }.to raise_error 'You cannot order that item.'
      end
    end

    describe '#checkout' do
      it 'fails if basket is empty' do
        expect { subject.checkout }.to raise_error 'You have nothing in your basket.'
      end
    end

    describe '#pay' do

      it 'makes sure #checkout has run' do
        expect { test_takeaway.pay(0) }.to raise_error 'You have not checked out yet.'
      end

      it 'checks that the total and amount paid match' do
        test_takeaway.checkout
        expect { test_takeaway.pay(0) }.to raise_error 'You have paid the wrong amount.'
      end

      it 'takes payment and send a text' do
        test_takeaway.pay(3, fake_text)
        expect(fake_text.confirmed).to eq("PAID")
      end

      it 'stops user paying twice' do
        expect { test_takeaway.pay(0) }.to raise_error 'You have not checked out yet.'
      end

    end

  end
end
