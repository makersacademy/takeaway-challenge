require './lib/object_printer'

describe ObjectPrinter do

  let(:object) { double(:object, name: 'Test Dish 1', description: 'Test dish 1 description', price: 10.95) }

  before(:each) do
    allow(object).to receive(:map).and_return(['Test Dish 1          ', 'Test dish 1 description          ', '10.95          '])
    allow(object).to receive(:join).and_return('Test Dish 1          Test dish 1 description          10.95          ')
  end

  context '#to_string' do
    it { is_expected.to respond_to(:to_string).with(2).arguments }

    it 'includes index' do
      expect(described_class.to_string(object, 0)).to match(/^0\./)
    end

    it 'includes name' do
      expect(described_class.to_string(object, 0)).to match(/Test Dish 1/)
    end

    it 'includes description' do
      expect(described_class.to_string(object, 0)).to match(/Test dish 1 description/)
    end

    it 'includes price' do
      expect(described_class.to_string(object, 0)).to match(/10.95/)
    end

  end

end
