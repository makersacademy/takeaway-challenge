require './lib/restaurant'
require './lib/menu'

describe Restaurant do
  alias_method :restaurant, :subject
  let(:dish) { double :dish }
  let(:input) { double :input }

  it 'lists dishes from given menu' do
    menu = Menu.new
    expect(restaurant.read_menu).to eq menu.cuisine
  end

  describe '#order' do
    it 'prints confirmation of order added to basket' do
      expect(restaurant.order('pho')).to eq "1x pho(s) added to basket"
    end
    it 'raises error if dish doesn\'t exist' do
      expect { restaurant.order('pizza') }.to raise_error "Unfortunately pizza isn't available"
    end
  end

  describe '#basket' do
    let(:basket_summary) { { "pho" => 1, "noodles" => 3 } }

    it 'returns basket summary' do
      restaurant.order('pho')
      restaurant.order('noodles', 3)
      expect(restaurant.basket).to eq basket_summary
    end
  end

  describe '#total' do
    it 'returns total cost of order' do
      expect(restaurant.total(input)).to eq input
    end
  end

end
