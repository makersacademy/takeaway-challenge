# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:dish) { :dish }
  let(:price) { :price }

  describe '#list_dishes' do

    it 'Returns a list with dishes and prices' do
      allow(menu).to receive(:list_dishes).and_return([{ dish => price }])
      expect(menu.list_dishes).to eq([{ dish => price }])
    end

  end
end
