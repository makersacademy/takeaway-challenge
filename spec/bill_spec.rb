require 'bill'

describe Bill do

  subject(:cust_bill) { described_class.new(get_orders, menu) }
  let(:get_orders) { { :pie => 2, :cranberry_juice => 2 } }
  let(:menu) { { :pie => 4.5, :cranberry_juice => 2.5 } }

  let(:conf) { double :conf }

  it "returns the bill" do
    expect(cust_bill.bill).to eq 14
  end

  it 'settles the bill' do
    cust_bill = Bill.new(get_orders, menu)
    cust_bill.bill
    expect { cust_bill.conf_message(0, conf) }.to raise_error "please settle the bill"
  end

end
