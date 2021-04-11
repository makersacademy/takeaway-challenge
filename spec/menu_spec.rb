require 'menu'
describe Menu do

  it 'displays a list of menu items' do
    expect(subject.read_menu).to have_key(:Lasagne)
  end 

  it 'displays their price' do
    expect(subject.read_menu).to have_value(12)
  end 

  it 'checks if a dish is on the menu' do
    expect(subject.has_dish?("Pizza")).to eq false 
  end 
end 
