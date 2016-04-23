require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new }
  let(:dishes) { { beef_burger: '1.99',  cheese_burger: '1.99', chicken_wings: '0.49', coke: '0.99' } }
  
  
  it 'contains a list of dishes' do
    expect(menu.dishes).to eq dishes
  end

  describe '#select_dish' do
    
    it 'returns chosen dish with name and price' do
      expect(menu.select_dish(:beef_burger)).to eq [{ :beef_burger => '1.99' }]
    end
    
    it 'can select multiple dishes' do
      expect(menu.select_dish(:beef_burger, 2)).to eq [{ :beef_burger => '1.99' },{ :beef_burger => '1.99' }]
    end
    
  end

end