require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'has a menu class' do
    expect(menu).to be_a Menu
  end

  it 'contains a hash for starters' do
    expect(menu.starters).to be_a Hash
  end

  it 'contains a hash for mains' do
    expect(menu.mains).to be_a Hash
  end

  it 'contains a hash for desserts' do
    expect(menu.desserts).to be_a Hash
  end

  it 'contains a hash for sides' do
    expect(menu.sides).to be_a Hash
  end

end
