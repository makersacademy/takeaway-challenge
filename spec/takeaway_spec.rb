require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, order: order, sms: sms) }
  let(:menu) { double :menu }
  let(:order) { double(:order, total: 10) }
  let(:sms) { double(:sms, deliver: nil) }
  let(:dishes) { { curry: 1, chips: 2 } }

  before do
    allow(order).to receive(:add)
  end 

  it "selects a number of dishes to order" do
    2.times { expect(order).to receive(:add) }
    takeaway.place_order(dishes)
  end

  it 'checks the total of the dishes in bucket' do
    total = takeaway.place_order(dishes)
    expect(total).to eq 10
  end
  
end
