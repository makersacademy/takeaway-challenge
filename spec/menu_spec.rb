require 'menu'

describe Menu do
  
  subject(:menu){ described_class.new }
  let(:dishes){ {
    'beef burger' => '1.99',
    'cheese burger' => '1.99',
    'chicken wings' => '0.49',
    'coke' => '0.99' 
    } }
  
  
  it 'contains a list of dishes' do
    expect(menu.dishes).to eq dishes
  end

  describe '#select_dish' do
    
    it 'returns chosen dish with name and price' do
      expect(menu.select_dish('beef burger')).to eq({ 'beef burger' => '1.99' })
    end
    
    it 'should return an error if the dish does not exist' do
      message = 'Dish is not on the menu: Please make another selection'
      expect { menu.select_dish('kapow!') }.to raise_error message
    end
    
  end
  
  describe '#add_dish' do
    it 'adds a dish to the menu' do
      menu.add_dish('pizza', '6.99')
      expect(menu.dishes['pizza']).to eq '6.99'
    end
  end
  
  describe '#remove_dish' do
    it 'removes a dish from the menu' do
      menu.remove_dish('beef burger')
      expect(menu.dishes['beef burger']).to eq nil
    end
  end
end