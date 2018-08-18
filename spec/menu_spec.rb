require 'menu'

describe Menu do

  let(:dish) { double :dish }

  it 'creates a menu' do
    expect(described_class).to respond_to(:new)
  end

  it 'adds a dish' do
    expect(subject.add(dish)).to eq dish
  end

end
