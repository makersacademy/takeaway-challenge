require "menu"

describe Menu do

  let(:menu) {described_class.new(items)}
  let(:items) do {

    burger: 1.99,
    chips: 1.00,
  }
  end

  it 'has a list of items and their prices' do
    expect(menu.items).to eq (items)
  end
end
