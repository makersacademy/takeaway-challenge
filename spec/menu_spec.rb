require 'menu'
describe Menu do

  context '#read_menu' do
    it 'displays a list of menu items' do
      expect(subject.read_menu).to have_key(:Lasagne)
    end 
    it 'displays their price' do
      expect(subject.read_menu).to have_value(12)
    end 
  end 

  context '#dish?' do
    it 'checks if a dish is on the menu' do
      expect(subject.dish?("Pizza")).to eq nil 
    end 
  end 

  context '#price' do
    it 'returns the price of the item' do
      expect(subject.price("Lasagne")).to eq 12
    end 
  end 
end 
