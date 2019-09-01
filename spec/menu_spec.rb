require './lib/menu'

describe Menu do
  let(:menu) {[{item: 5, name: "rice", price: 10}]}

  describe "#print_menu" do
    it 'takes a menu as a array of hashes and returns it as a formatted string' do
      expect(subject.print_menu(menu)).to include("5. rice - 10")
    end
  end

  describe "#item_available?" do
    it 'returns true if item is available on the menu' do
      expect(subject.item_available?(5)).to eq(true)
    end

    it 'returns false if item is not on the menu' do
      expect(subject.item_available?(10)).to eq(false)
    end
  end

end