require 'Menu'

describe Menu do
subject(:menu) { described_class.new }
  it 'initializes with an empty hash for menu' do
    expect(subject.menu).to be_empty
  end

  describe '#add_items' do
  let(:item) {"Hamburger"}
  let(:price) {5}
    it 'adds to menu' do
    subject.add_items(item, price)
    expect(subject.menu).to include({key:1, name: item, price: price})
    end
  end
end
