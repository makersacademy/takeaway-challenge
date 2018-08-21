require 'bill'

describe Bill do

  it "returns the bill" do
    get_orders = { :pie => 2, :cranberry_juice => 2 }
    cust_bill = Bill.new(get_orders)
    expect(cust_bill.bill).to eq 14
  end

  it 'settles the bill' do
    get_orders = { :pie => 2, :cranberry_juice => 2 }
    cust_bill = Bill.new(get_orders)
    cust_bill.bill
    expect { cust_bill.conf_message(0, conf = Sms.new) }.to raise_error "please settle the bill"
  end

end
