require 'menu'

describe Menu do
  subject(:menu) do
    described_class.new(price_calculator_klass)
  end
  let(:price_calculator_klass) do
    double :price_calculator_klass, new: price_calculator
  end
  let(:price_calculator) {double :price_calculator, price: 3.99}
  let(:selected_dishes) {{dish => 3}}
  let(:dish) {double :dish}
  before do
    allow(dish).to receive(:name) {:chow_mein}
    allow(dish).to receive(:price) {3.99}
  end
  context '#initialize' do
    it 'starts with an empty price list' do
      expect(menu.price_list).to be_empty
    end
  end

  context '#add_dishes' do
    it 'adds dishes to the menu' do
      menu.add_dishes(dish)
      expect(menu.view_prices).to eq menu.price_list
    end
  end

  context '#view_prices' do
    before do
      menu.add_dishes(dish)
    end

    it 'presents the dishes to the user' do
      expect(menu.view_prices).to eq(menu.price_list)
    end
  end

  context '#select_dish' do
    it 'sets the quantity of dishes requested' do
      menu.select_dish(dish,3)
      expect(menu.selected_dishes[dish]).to eq 3
    end

    it 'sets the dishes as selected' do
      expect{menu.select_dish(dish)}.to change{menu.selected_dishes}
    end
  end

  context 'taking the order' do
    it 'creates the price calculator' do
      expect(price_calculator_klass).to receive(:new)
      menu.take_order(dish)
    end
  end
end
