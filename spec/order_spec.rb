require 'order'

describe Order do
  subject(:order) { described_class.new(menu_klass)}
  let(:menu_klass) { double :menu_klass, select: dish }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:dishes) { double :dish }

  describe '#menu' do
    it {is_expected.to respond_to :menu}
  end

  describe '#choose' do
    it 'should enable a user to select a dish' do
      allow(order).to receive(:dishes).and_return(["Dish 1", 5.0])
      order.choose(dish)
      expect(order.dishes).not_to be_empty
    end

    it 'should enable a user to select multiple quantities of dishes' do
      allow(order).to receive(:dishes).and_return(["Dish 1", 5.0])
      order.choose("Dish 1", 3)
      expect(order.dishes).not_to be_empty
    end
  end

  describe '#calculate_quantities' do
    it 'calculates how many dishes have been ordered' do
      order.calculate_quantities(dishes)
      expect(order.quantity).not_to be_nil
    end
  end

  describe '#calculate_cost' do
    it 'calculates how much the order costs' do
      order.calculate_cost(order)
      expect(order.total).not_to be_nil
    end
  end

end
