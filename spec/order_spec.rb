require 'order'

describe Order do
  let(:dish_name) { 'Jalfrezi' }
  let(:dish_price) { 7.99 }
  let(:dish) { Dish.new(dish_name, dish_price) }
  let(:menu) { Menu.new }
  before { menu.add_dish dish }
  subject { described_class.new(menu) }

  describe '#add_to_basket' do
    it 'increases the total price by the price of the item' do
      expect { subject.add_to_basket(dish_name) }.to change { subject.total_price }.by dish_price
    end
  end

end
