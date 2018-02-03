require 'restaurant'

describe Restaurant do
  let(:restaurant) { described_class.new }

  describe '#print_menu' do
    it 'outputs the menu' do 
      full_indonesian_menu = "Our traditional indonesian menu includes:\nPepes Ikan: £3\nSatay: £3\nBakso Urat: £4\nSoto: £4\nNasi Goreng: £5"
      expect { restaurant.print_menu }.to output.to_stdout
    end
  end

end
