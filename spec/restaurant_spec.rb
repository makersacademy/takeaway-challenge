require 'restaurant'

describe Restaurant do

  it { is_expected.to respond_to(:menu) } # .with(1).argument

  describe '#initialize' do
    it 'should initialize with a new instance of the Menu class' do
      expect(Restaurant.new.menu).not_to be nil
    end

    it 'should initialize with a new instance of the Order class' do
      expect(Restaurant.new.order).not_to be nil
    end
  end

    describe '#checkout' do
      it 'should move the contents of @basket to @current_order' do
        subject.menu.order_item(1, 1)
        subject.checkout
        expect(subject.order.current_order).to eq [{ "food" => 5 }]
      end

      it 'should clear the contents of @basket' do
        subject.menu.order_item(1, 1)
        subject.checkout
        expect(subject.menu.basket).to eq []
      end
    end
end
