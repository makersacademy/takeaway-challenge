require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  starters = {:soup => 1.50,
  :salad => 1.00,
  :scallops => 2.50}
  mains = {:steak => 7.50,
  :lasagne => 5.50,
  :lobster => 8.00 }
  desserts = {:tiramisu => 2.50,
  :cheesecake => 2.00,
  :profiteroles => 1.50}
  sides = {:bread => 0.50,
  :chips => 1.50,
  :kimchi => 2.00}

  it 'has a menu class' do
    expect(menu).to be_a Menu
  end

  it 'contains a hash for starters' do
    expect(menu.starters).to eq starters
  end

  it 'contains a hash for mains' do
    expect(menu.mains).to eq mains
  end

  it 'contains a hash for desserts' do
    expect(menu.desserts).to eq desserts
  end

  it 'contains a hash for sides' do
    expect(menu.sides).to eq sides
  end

  it 'can display a full menu in an array' do
    expect(menu.full_menu).to eq [starters, mains, desserts, sides]
  end

end
