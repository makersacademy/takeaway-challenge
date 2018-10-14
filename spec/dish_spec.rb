require 'dish'

describe Dish do
  let(:name) { 'name' }
  let(:price) { 8 }
  let(:type) { :main }
  subject { described_class.new(name, price, type) }

  context 'attributtes' do

    describe '#name' do
      it 'has a name' do
        expect(subject.name).to eq name
      end
    end

    describe '#price' do
      it 'has a price' do
        expect(subject.price).to eq price
      end
    end

    describe '#type' do
      it 'has a type' do
        expect(subject.type).to eq type
      end
    end
  end
end
