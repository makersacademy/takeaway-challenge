require 'takeaway'

describe Takeaway do

  # Takeaways
  let(:subject) do
    described_class.new(menu: some_menu, order: some_order)
  end

  # Other mocks
  let(:dish) { double(:dish, name: :Double_trouble, price: 12.99) }
  let(:some_menu) { double(:some_menu, dish_list: [dish]) }
  let(:some_order) { double(:some_order, cart: {}, total: 25.98, canceled: nil, payed: nil) }

  describe '#initialize' do
    it 'has some menu preloaded' do
      expect(subject.menu).to eq(some_menu)
    end

    it 'has an empty list of orders' do
      expect(subject.orders).to eq([some_order])
    end
  end

  describe '#show_menu' do
    after(:each) { subject.show_menu }
    it 'prints the menu title' do
      expect(subject).to receive(:print_menu_title)
    end
    it 'prints the menu in a fancy way' do
      expect(subject).to receive(:print_menu_line).with(:Double_trouble, 12.99)
    end
  end

  describe '#order' do
    it 'sends the ordered dish and quantity to the order' do
      expect(some_order).to receive(:add).with(dish, 2)
      subject.order("Double_trouble", 2)
    end
  end

  describe '#checkout' do
    context 'with no items in the cart' do
      it 'raises an error' do
        expect { subject.checkout }.to raise_error RuntimeError
      end
    end

    context 'with items in the cart' do
      before(:each) do
        allow(some_order).to receive(:cart).and_return({ dish => 2 })
      end
      after(:each) { subject.checkout }
      it 'prints the checkout title' do
        expect(subject).to receive(:print_title)
      end
      it 'prints the checkout in a fancy way' do
        expect(subject).to receive(:print_line).with(:Double_trouble, 25.98, 2)
      end
    end
  end

  describe '#pay' do
    context 'with no items in the cart' do
      it 'raises an error' do
        expect { subject.pay(25.98) }.to raise_error RuntimeError
      end
    end

    context 'with items in the cart' do
      before(:each) do
        allow(subject).to receive(:send_sms)
        allow(some_order).to receive(:cart).and_return({ dish => 2 })
      end
      context 'the sum paid does not equal the total' do
        it 'raises an error' do
          expect { subject.pay(8) }.to raise_error RuntimeError
        end
      end

      context 'the sum equals the total' do
        it 'sends an sms' do
          expect(subject).to receive(:send_sms)
          subject.pay(25.98)
        end
        it 'tells the order to change to "payed"' do
          expect(some_order).to receive(:payed)
          subject.pay(25.98)
        end
        it 'creates a new current order' do
          subject.pay(25.98)
          expect(subject.orders.length).to eq(2)
        end
      end
    end
  end

  describe '#cancel_order' do
    it 'tells the order to change to "canceled"' do
      expect(some_order).to receive(:canceled)
      subject.cancel_order
    end
    it 'creates a new current order' do
      subject.cancel_order
      expect(subject.orders.length).to eq(2)
    end
  end
end
