require 'menu'

describe Menu do
  it 'can have a list of dishes stored as a hash' do
    expect(subject.items).to be_a Hash
  end
  it 'can load dishes from a yaml file' do
    yaml_file = './menu.yml'
    subject.load(yaml_file)
    expect(subject.items).not_to be_empty
  end

  it 'accepts a menu yml as an argument' do
    menu = described_class.new(menu: './menu.yml')
    expect(menu.items).not_to be_empty
  end

  it 'can retrieve an individual item from the menu' do
    dish1 = subject.items[1]['dish']
    price1 = subject.items[1]['price']
    item1 = { 'dish' => dish1, 'price' => price1 }
    expect(subject.item(1)).to eq item1
  end
end