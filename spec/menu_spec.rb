require 'menu'

describe Menu do

  it {should respond_to(:menu)}

  describe '#add_to_menu' do

    it 'adds an item to menu with price' do
      subject.add_to_menu(:item_1,:item_1_price)
      expect(subject.menu).to include(:item_1 => :item_1_price)
    end
  end
end
