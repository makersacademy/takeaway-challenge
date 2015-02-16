require 'takeaway'

describe Takeaway do 

  let(:order) { double :order }
  let(:name) { double :name }
  let(:payment_amount) { double :payment_amount}

  it 'will raise an error if not enough paid for an order' do
    expect(order).to receive :total_price
    takeaway = Takeaway.new
    expect { takeaway.process_order(order, payment_amount, name)}.to raise_error
  end

end