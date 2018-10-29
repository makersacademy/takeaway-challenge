require 'menu'

describe Menu::Dish do
  let(:name) { 'name' }
  let(:price) { 8 }
  subject { described_class.new(name, price) }

  context 'attributes' do

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
  end
end
