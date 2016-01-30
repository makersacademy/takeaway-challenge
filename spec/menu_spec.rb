require 'menu'

describe Menu do

  it {is_expected.to respond_to(:dishes)}

  subject(:menu){described_class.new}
  let(:item){'pizza'}
  let(:cost){4}

  describe 'initialize' do
    it 'initializes with a hash of dishes' do
      expect(menu.dishes).to be_a Hash
    end
  end

  describe 'price' do
    it 'shows the price of a particular dish' do
      expect(menu.price(item)).to eq cost
    end
  end
end
