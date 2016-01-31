require 'menu'

describe Menu do
  subject(:menu) do
    described_class.new(price_calculator_class: price_calculator_class)
  end
  let(:price_calculator_class) do
    double(:price_calculator_class, new: price_calculator)
  end
  let(:price_calculator) {double :price_calculator}
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
    it 'sets up the dishes for viewing' do
      expect{menu.view_prices}.to change{menu.price_list}
    end

    it 'presents the dishes to the user' do
      expect(menu.view_prices).to eq(menu.price_list)
    end
  end

  context '#select_dish' do
    it 'passes a set_selected call to the dish' do
      expect(dish).to receive(:set_selected)
      menu.select_dish(dish)
    end
  end
end
