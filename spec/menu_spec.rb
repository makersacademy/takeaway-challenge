require 'menu'
describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { :dish }
  let(:price) { :price }

  describe '#list_dishes' do

    it 'Returns a list of dishes and prices' do
      allow(menu).to receive(:list_dishes).and_return([{ dish => price }])
      expect(menu.list_dishes).to eq([{ dish => price }])
    end

  end
end
