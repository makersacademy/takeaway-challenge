require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish1) { { name: "Steak", price: 25 } }
  let(:dish2) { { name: "Chips", price: 8 } }
  let(:dish3) { { name: "Caesar Salad", price: 9 } }

  describe '#initialize' do

    it 'it is created with a blank list of menu items' do
      expect(menu.item_list).to eq []
    end
  end

  describe '#add_item' do
    let(:items) { [{ name: "Steak", price: 25 }, { name: "Chips", price: 8 }] }

    it 'adds a new item to the list of items' do
      menu.add_item(dish1)
      expect(menu.add_item(dish2)).to eq items
    end
  end

  describe '#display' do
    let(:pretty_print) { "Steak - £25\nChips - £8\nCaesar Salad - £9\n" }
    it 'pretty prints a menu' do
      menu.add_item(dish1)
      menu.add_item(dish2)
      menu.add_item(dish3)
      expect { menu.display }.to output(pretty_print).to_stdout
    end
  end
end
