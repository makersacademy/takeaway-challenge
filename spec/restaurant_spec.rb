require './lib/restaurant'

describe Restaurant do
  alias_method :restaurant, :subject
  let(:menu) { Restaurant::MENU }
  let(:dish) { double dish }

  it 'has a list of dishes stored as constant' do
    expect(restaurant.read_menu).to eq menu
  end

  describe '#order' do
    it 'prints confirmation of order added to basket' do
      expect(restaurant.order('pho')).to eq "1x pho(s) added to basket"
    end
    it 'raises error if dish doesn\'t exist' do
      expect { restaurant.order('pizza') }.to raise_error "Unfortunatley pizza isn't available"
    end
  end

end
