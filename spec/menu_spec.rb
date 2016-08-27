require 'menu'

describe Menu do

subject(:menu) {described_class.new}

describe '#print_menu' do
  specify { expect { menu.show_menu }.to output.to_stdout }
end

describe '#check_price' do
  it 'returns price if item on menu' do
    expect(menu.check_price('Spring Roll')).to eq 0.99
  end
  it 'Raise error if item not on menu' do
    expect{menu.check_price('Television')}.to raise_error 'Item not on menu'
  end
end

describe '#calculate_total' do
  it 'Returns the item totals for a basket' do
    basket = {"Spring roll"=>10, "pork dumpling"=>4}
    expect(menu.calculate_subtotal(basket)).to eq [["Spring roll", 10, 9.90], ["pork dumpling", 4, 11.96]]
  end
end

end
