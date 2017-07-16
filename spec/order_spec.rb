require 'order'

describe Order do

  let(:order_1) {described_class.new( [ { "Pie n Mash" => 2 }, 10.50 ] ) }

  it "stores amount of dishes" do
    expect(order_1.dish).to eq( { "Pie n Mash" => 2 } )
  end

  it "stores the customers total payment" do
    expect(order_1.payment).to eq 10.50
  end


end
