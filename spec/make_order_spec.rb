require 'make_order'
require 'menu'

describe MakeOrder do
  it 'checks to see if multiple items have been added to order list', :orderlist do
    make_order = MakeOrder.new
    allow(subject).to receive(:pizza).and_return("Margeritta")
    expect(subject.order).to eq [[2, {'Margeritta' => 10}], [3, {'Ham' => 11}]]
  end
end
