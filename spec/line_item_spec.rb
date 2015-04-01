require 'line_item'

describe LineItem do
  line_item = described_class.new
  add_qty = 2
  add_dish = { "Cod" => 4 }
  line_item.add add_qty, add_dish

  it 'can contain a dish' do
    expect(line_item.dish.key?("Cod")).to be true
  end

  it 'can contain a dish quantity' do
    expect(line_item.dish.value?(2)).to be true
  end

  it 'can contain a subtotal' do
    expect(line_item.sub_total).to eq 8
  end
end
