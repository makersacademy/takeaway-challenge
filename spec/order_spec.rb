require "order"

describe Order do 

  before(:each) do
    @dish = double 'dish'
  # let(:quantity) {double :quantity}
  end
  it "can select a meal for order" do 
    expect(subject.order_food(@dish)).to eq[{ dish: dish }]
  end

  it "calculates order total" do
    subject.order_food(:rice, "1")
  end

end
