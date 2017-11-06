require 'menu'

describe Menu do
  # subject(:menu) { described_class.new }
  let(:full_menu) {
    [{ name: 'burger', price: 5 },
    { name: 'chicken', price: 5 },
    { name: 'chips', price: 3 },
    { name: 'pizza', price: 7 },
    { name: 'nachos', price: 3 },
    { name: 'sweet potato fries', price: 4 },
    { name: 'veggie roll', price: 5 }]
  }

  describe '#menu' do
    it 'should show menu' do
      expect(subject.show).to eq full_menu
    end
  end
end
