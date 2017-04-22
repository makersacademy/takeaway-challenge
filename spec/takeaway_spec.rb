require './lib/takeaway'

describe Takeaway do
  alias_method :takeaway, :subject
  let(:menu) { Takeaway::MENU }
  let(:dish) { double dish }

  it 'has a list of dishes stored as constant' do
    expect(takeaway.read_menu).to eq menu
  end

  describe '#order' do
    it 'prints confirmation of order added to basket' do
      expect(takeaway.order('pho')).to eq "1x pho(s) added to basket"
    end
    it 'raises error if dish doesn\'t exist' do
      expect { takeaway.order('pizza') }.to raise_error "Unfortunatley pizza isn't available"
    end
  end

end
