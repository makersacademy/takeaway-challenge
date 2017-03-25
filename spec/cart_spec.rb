require './lib/menu.rb'

describe Cart do

  let(:cart) {described_class.new}
  let(:menu) {double :menu}
  let(:curry) {double :dish, :name => "Vindaloo", :price => 8}

  it 'adds the selected dishes to the basket in the quantity specified ' do
    cart.add_to_basket(curry, 2)
    expect(cart.basket).to include ({:name =>"Vindaloo", :price =>8, :quantity => 2})
  end



end
