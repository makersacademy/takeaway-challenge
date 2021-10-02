require 'menu_item'

describe MenuItem do

  it 'return a string' do
    pizza = MenuItem.new("Pizza", 10)
    expect(pizza.to_s).to eq("Pizza - £10.00")
  end
end
