require 'line_item'

describe LineItem do
  qty = 2
  dish = { "Cod" => 4 }
  let(:line_item) { described_class.new qty, dish }

  before do
    line_item
  end

  it 'can contain a dish' do
    # puts line_item.inspect
    expect(line_item.dish.key?("Cod")).to be true
  end

  it 'can contain a dish quantity' do
    expect(line_item.dish.value?(2)).to be true
  end

  it 'can contain a subtotal' do
    expect(line_item.sub_total).to eq 8
  end
end
