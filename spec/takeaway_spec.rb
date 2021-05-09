require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, display: "Test Menu") }
  let(:order) { double(:order, display: "Test Order") }

  subject { described_class.new(menu, order) }

  it 'displays the menu' do
    expect(subject.display_menu).to eq("Test Menu")
  end

  it 'displays the current order' do
    expect(subject.display_order).to eq("Test Order")
  end

  it 'adds item to current order' do
    allow(menu).to receive(:find_item)
    allow(menu).to receive(:update)
    allow(order).to receive(:add)
    expect(subject.add("item_one", 1)).to eq("1 x item_one added") 
  end

  it 'displays the total' do
    allow(order).to receive(:total).and_return("£25.0")
    expect(subject.total).to eq("£25.0")
  end
end
