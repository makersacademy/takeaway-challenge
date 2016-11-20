require "order"

describe Order do

  subject( :order ){ described_class.new( phone_number, order1, order2 ) }
  let( :phone_number ){ double :phone_number }
  let( :order1 ){ double :order }
  let( :order2 ){ double :order }

  it "should has customer info" do
    expect( order.phone ).to eq phone_number
  end

  it "should has orders" do
    expect( order.order ).to eq [ order1, order2   ]
  end

end
