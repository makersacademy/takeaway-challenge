require 'order'

describe Order do

  it 'creates an order' do
    expect(described_class).to respond_to(:new)
  end

  it 'adds an item to the order' do
    expect(subject.add_item).to eq nil
  end

end
