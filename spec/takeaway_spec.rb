require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(order, menu) }
  let(:menu) { double :menu }
  subject(:order) { double :order }

  before do
    allow(menu).to receive(:display_menu).and_return({ "Carbonara" => 20 })  
  end

  it 'adds item to basket' do
    expect(takeaway.read_menu).to eq({ "Carbonara" => 20 })
  end
end