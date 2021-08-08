require "./lib/order.rb"

describe Order do
  
  it "expects the order to be empty" do
    expect(subject.items).to be_empty
  end

end
