require 'menu'

describe Menu do
  describe '#show' do
    it { is_expected.to respond_to(:show)}

    it 'is empty by default' do
      expect(subject.show.length).to eq(0)
    end
  end
  describe 'adding items to menu' do
    let(:name) { double(:name)}
    let(:price) { double(:price) }
    let(:quantity) { double(:quantity) }
    let(:item) { double(Item.new(name, price, quantity)) }
    it 'adds 1 item to the menu and stores it in the list' do
      item = double(Item.new(name, price, quantity), :name => name, :price => price, :quantity => quantity)
      subject.add(item)
      expect(subject.list).to include([name, price, quantity])
    end
  end
end
