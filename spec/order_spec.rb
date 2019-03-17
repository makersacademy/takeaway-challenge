require 'order'

describe Order do
  subject(:order) { Order.new }
  
  let(:bucket) do
    { curry: 1, 
      chips: 2 }
  end  

  it "selects several dishes from the menu" do
    order.add(:curry, 1)
    order.add(:chips, 2)
    expect(order.bucket).to eq (bucket)
  end
end
