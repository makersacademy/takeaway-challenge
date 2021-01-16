require 'order'

describe Order do
  let(:dish_name) { 'Jalfrezi' }
  let(:dish_price) { 7.99 }
  let(:dish) { Dish.new(dish_name, dish_price) }
  let(:menu) { Menu.new }
  let(:text_class) { double(:text) }
  before { menu.add_dish dish }
  subject { described_class.new(menu, text_class) }

  describe '#add_to_basket' do
    it 'increases the total price by the price of the item' do
      expect { subject.add_to_basket(dish_name) }.to change { subject.total_price }.by dish_price
    end
    context 'when passed a quantity as well as a dish' do
      it 'increases the total price by the quantity times the price' do
        expect { subject.add_to_basket(dish_name, 2) }.to change { subject.total_price }.by 2 * dish_price
      end
    end
    context 'when passed a non-integer decimal' do
      it 'raises a must be positive integer error' do
        expect { subject.add_to_basket(dish_name, 2.5) }.to raise_error 'Quantity must be a positive integer'
      end
    end
    context 'when passed a negative number' do
      it 'raises a must be positive integer error' do
        expect { subject.add_to_basket(dish_name, -1) }.to raise_error 'Quantity must be a positive integer'
      end
    end
  end

  describe '#place_order' do
    it 'passes the order time to send in text class' do
      expect(text_class).to receive(:send_delivery_expected)
      subject.add_to_basket dish_name
      subject.place_order
    end
    context 'when the basket is empty' do
      it "should raise a can't place empty order error" do
        # expect
      end
    end
  end

end
