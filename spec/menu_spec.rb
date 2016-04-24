require 'menu'

describe Menu do

  it {should respond_to(:menu)}

  describe '#add_to_menu' do

    it 'adds an item to menu with price' do
      subject.add_to_menu(:item_1,:item_1_price)
      expect(subject.menu).to include(:item_1 => :item_1_price)
    end
  end

  describe '#include?' do

    it 'returns true if item is included in menu' do
      expect(subject.include?("battery burger")).to be_truthy
    end

    it 'returns false if item is not included in menu' do
      expect(subject.include?("apricots")).to be_falsey
    end
  end
end
