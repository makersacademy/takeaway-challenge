require 'menu'
describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { :dishes }
  let(:dish) { :dish }
  let(:price) { :price }

  describe '#list_dishes' do
    it 'returns a list of dishes' do
      allow(menu).to receive(:list_dishes).and_return(dishes)
      expect(menu.list_dishes).to eq(dishes)
    end

    it 'The list returned has dishes and prices' do
      allow(menu).to receive(:dishes).and_return([{ dish => price }])
      expect(menu.dishes[0]).to eq({ dish => price })
    end
  end
end
