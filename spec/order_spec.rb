require "order"

describe Order do

  subject( :order ){ described_class.new( customer, order1, order2 ) }
  let( :customer ){ double :customer }
  let( :order1 ){ double :order }
  let( :order2 ){ double :order }

  it "should has customer info" do
    expect( order.customer_info ).to eq customer
  end

  it "should has orders" do
    expect( order.order ).to eq [ order1, order2 ]
  end

end
