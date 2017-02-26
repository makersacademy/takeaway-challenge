require 'confirmation'
require 'make_order'


describe Confirmation do
  it 'checks to see if correct items have been added to order', :orderlist do
    make_order = MakeOrder.new

    confirmation = Confirmation.new(["Pepperoni", "Fish"], 38)
    expect(confirmation.order_information).to eq [[2, {'Pepperoni' => 10}], [3, {'Fish' => 11}]]
  end
end
