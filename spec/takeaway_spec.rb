require 'takeaway'

describe Takeaway do

  # Takeaways
  let(:subject) do
    described_class.new(menu_class: menu_class, order_class: order_class)
  end

  # Other mocks
  let(:dish) { double(:dish, name: :Double_trouble, price: 12.99) }
  let(:some_menu) { double(:some_menu, dish_list: [dish]) }
  let(:some_order) { double(:some_order, cart: {}, total: 25.98) }
  let(:menu_class) { double(:menu_class, new: some_menu) }
  let(:order_class) { double(:order_class, new: some_order) }

  describe '#initialize' do
    it 'has some menu preloaded' do
      expect(subject.menu).to eq(some_menu)
    end

    it 'has an empty list of orders' do
      expect(subject.orders).to eq([some_order])
    end
  end

  describe '#show_menu' do
    it 'prints the menu in a fancy way' do
      expect(subject.show_menu).to eq([dish])
    end
  end

  describe '#order' do
    after(:each) { subject.order("Double_trouble", 2) }
    it 'sends the ordered dish and quantity to the order' do
      expect(some_order).to receive(:add).with(dish, 2)
    end
  end

  describe '#checkout' do
    context 'with items in the cart' do
      it 'prints the checkout in a fancy way' do
        allow(some_order).to receive(:cart).and_return({ dish => 2 })
        expect(subject.checkout).to eq nil
      end
    end

    context 'with no items in the cart' do
      it 'raises an error' do
        expect { subject.checkout }.to raise_error RuntimeError
      end
    end
  end

  describe '#pay' do
    before(:each) { allow(subject).to receive(:send_sms) }
    context 'with items in the cart' do
      before(:each) do
        allow(some_order).to receive(:cart).and_return({ dish => 2 })
        allow(some_order).to receive(:payed)
      end
      context 'the sum paid does not equal the total' do
        it 'raises an error' do
          expect { subject.pay(8) }.to raise_error RuntimeError
        end
      end

      context 'the sum equals the total' do
        before { subject.pay(25.98) }
        it 'confirms the order' do
          expect(subject.orders.length).to eq(2)
        end
      end
    end

    context 'with no items in the cart' do
      it 'raises an error' do
        expect { subject.pay(25.98) }.to raise_error RuntimeError
      end
    end
  end

  describe '#cancel_order' do
    before do
      allow(some_order).to receive(:canceled)
      subject.cancel_order
    end
    it 'cancels the order' do
      expect(subject.orders.length).to eq(2)
    end
  end
end
