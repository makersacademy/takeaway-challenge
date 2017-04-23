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

  context 'adds order to basket' do

    before { restaurant.order('noodles') }
    before { restaurant.order('pho', 2) }

    describe '#basket' do
      let(:basket_summary) { { "pho" => 2, "noodles" => 1 } }

      it 'returns basket summary' do
        expect(restaurant.basket).to eq basket_summary
      end
    end

    describe '#total' do
      it 'returns total cost of order if passed correct input' do
        expect(restaurant.total(14)).to eq "Total: £14 Would like to checkout or add more to your order?"
      end
      it 'returns error if incorrect total input' do
        expect { restaurant.total(12) }.to raise_error "Error: Incorrect input, total is: £14 "
      end
    end

    describe '#checkout' do
      it 'total cost is deducted and user receives text confirmation using Twilio API' do
        expect(restaurant.checkout).to eq "Order succesful! You have paid £14. Please await text confirmation"
      end
    end

  end

  describe '#order' do
    it 'prints confirmation of order added to basket' do
      expect(restaurant.order('pho')).to eq "1x pho(s) added to basket"
    end
    it 'raises error if dish doesn\'t exist' do
      expect { restaurant.order('pizza') }.to raise_error "Unfortunately pizza isn't available"
    end
  end

  describe '#add' do
    it 'prints confirmation of order added to basket' do
      expect(restaurant.add('bun')).to eq "1x bun(s) added to basket"
    end
    it 'raises error if dish doesn\'t exist' do
      expect { restaurant.add('beer') }.to raise_error "Unfortunately beer isn't available"
    end
  end

end
