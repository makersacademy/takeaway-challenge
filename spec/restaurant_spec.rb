require 'restaurant'

describe Restaurant do
  let(:restaurant) { described_class.new }
  let(:order) { Order.new }
  let(:item) { "Pepes ikan" }

  describe '#print_menu' do
    it 'outputs the menu' do 
      full_indonesian_menu = "Our traditional indonesian menu includes:\nPepes ikan: £3\nSatay: £3\nBakso urat: £4\nSoto: £4\nNasi goreng: £5"
      expect { restaurant.print_menu }.to output.to_stdout
    end
  end

  describe '#add_item' do 
    it 'adds selected item to order' do
      restaurant.add_item(item)
      expect(order.items).to include(item)
      p order.items
    end

    it 'raises an error when item isnt available' do 
      #######
    end
  end
end
