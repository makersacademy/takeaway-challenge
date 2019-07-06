require 'menu'
describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { :dish }
  let(:price) { :price }

  describe '#dishes' do

    it 'Returns a list of dishes and prices' do
      allow(menu).to receive(:dishes).and_return([{ dish => price }])
      expect(menu.dishes).to eq([{ dish => price }])
    end
  end
end
