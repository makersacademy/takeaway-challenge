require 'line_item'

context 'Line item' do
  line_item = LineItem.new
  add_qty = 2
  add_dish = { "Cod" => 4 }
  line_item.add add_qty, add_dish
  puts "---" * 10
  # puts line_item
  # puts line_item.dish
  puts line_item.dish[0]
  puts line_item.sub_total

  it 'can contain a dish' do
    # puts "---" * 10
    expect(line_item.dish.key?("Cod")).to be true
  end

  it 'can contain a dish quantity' do
    expect(line_item.dish.values).to eq add_qty
  end

  it 'can contain a subtotal' do

  end
end
