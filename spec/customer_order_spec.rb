require 'customer_order'
require 'menu'

describe CustomerOrder do

  let(:menu) { double(:menu) }

  it 'responds to add' do
    expect(subject).to respond_to(:add)
  end

  it 'selects items off menu hash' do
    allow(menu).to receive(:on_menu?) { true }
    subject.add("Biltong", 1)
    expect(subject.order).to eq({ :Biltong => 1 })
  end

  it 'adds items to order' do
    allow(menu).to receive(:on_menu?) { true }
    subject.add("Chops", 1)
    expect(subject.order).to eq({ :Chops => 1 })
  end

  it 'raises en error if item not on menu selected' do
    allow(menu).to receive(:has_dish?).with(:Bunnychow) { false }
    expect { subject.add(:Bunnychow, 2) }.to raise_error "Bunnychow is not available"
  end

  it 'checks the the total' do
    allow(menu).to receive(:on_menu?) { true }
    subject.add("Biltong", 2)
    subject.add("Chops", 1)
    total_price = 19
    expect(subject.total_price).to eq("£#{total_price}")
  end
end
