require './lib/takeaway'

describe Takeaway do
  alias_method :takeaway, :subject
  let(:dishes) { Takeaway::DISHES }

  it 'has a list of dishes stored as constant' do
    expect(takeaway.list_dishes).to eq dishes
  end

  describe '#order' do
    it 'prints confirmation of order added to basket' do
      expect(takeaway.order('Pho')).to eq "1x pho(s) added to basket"
    end
  end

end
