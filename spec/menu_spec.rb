require 'menu'

describe Menu do
  let(:description) {"Cheeseburger"}
  let(:price) {4.99}
  let(:burger_to_s) {"#{description}\t#{price}"}
  let(:burger) do
    double :dish,
    description: description,
    price: price,
    to_s: burger_to_s
  end
  let(:menu_loader) {double :menu_loader, load: [burger]}
  let(:menu_loader_klass) {double :menu_loader_klass, new: menu_loader}
  subject(:menu) {described_class.new(menu_loader_klass: menu_loader_klass) }

  context 'Menu Items' do
    it {is_expected.to respond_to(:dishes)}

    it 'Starts with a menu loaded in' do
      expect(menu.dishes).not_to be_empty
    end
  end

  context 'Choosing a dish' do
    it {is_expected.to respond_to(:choose).with(1).argument}

    it 'selects a dish by its description' do
      expect(menu.choose(description)).to eq burger
    end

    it 'returns nothing if the dish is not on the menu' do
      expect(menu.choose("non existant")).to be_nil
    end
  end

  context 'Display Menu' do
    it 'prints the menu' do
      expect(menu.to_s).to eq "#{burger_to_s}\n"
    end
  end
end
