# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'menu'

describe Menu do
  let(:menu) { Menu.new(dishes) }
  let(:dishes) { :dishes }
  let(:dish) { :dish }
  let(:price) { :price }

  describe '#list_dishes' do
    it 'Provides a list of dishes' do
      allow(menu).to receive(:list_dishes).and_return(dishes)
      expect(menu.list_dishes).to eq(dishes)
    end
  end

  describe '#dishes' do
    it 'Contains dishes and prices' do
      allow(menu).to receive(:dishes).and_return([{ dish => price }])
      expect(menu.dishes[0]).to eq({ dish => price })
    end
  end
end
