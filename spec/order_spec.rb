require 'order'

describe Order do
  let(:order) { Order.new }
  
  it "lets the user select items from the menu" do
    expect(order.select("samosas")).to eq "samosas"
  end
end