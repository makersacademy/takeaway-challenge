require 'make_order'

describe MakeOrder do

  before :each do
    @make_order = MakeOrder.new
    $stdin = StringIO.new('order')
  end

  it 'adds a dish to the order' do
    @make_order.add_to_order(1)
    expect(@make_order.current_order.ordered_dishes).to eq([{ dish: :Pizza, price: 8.50 }])
  end

  # it 'completes an order' do
  #
  # end

end
