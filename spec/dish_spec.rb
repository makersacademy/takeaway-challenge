require 'dish'

describe Dish do

  let(:name) { double :name }
  let(:price) { double :price }

  subject { described_class.new(name, price) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:price) }

  describe '#to_s' do
    it 'returns name and price of dish' do
      expect(subject.to_s).to eq("Name: #{name}, Price: #{price}")
    end
  end
end
