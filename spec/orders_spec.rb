require 'orders'
# require 'sms'

describe Orders do

  let(:menu) { double :menu, :menu_items => { :pie => 4.5, :chips => 2.50 } }
  let(:bill_klass) { double :bill_klass, :new => mockbill }
  let(:mockbill) { double :mockbill, :bill => 14 }

  it 'chooses the menu' do
    expect(subject.choose_menu(menu)).to eq menu.menu_items
  end

  it 'responds to 2 arguments' do
    expect(subject).to respond_to(:cust_order).with(2).arguments
  end

  it "can place multiple orders" do
    subject.choose_menu(menu)
    subject.cust_order("pie", 3)
    subject.cust_order("chips", 2)
    expect(subject.cust_orders).to eq({ pie: 3, chips: 2 })
  end

  it "raises an error if dish is not on the menu" do
    subject.choose_menu(menu)
    expect { subject.cust_order('chicken', 2) }.to raise_error "sorry, dish is not available"
  end

  it "confirms customer order" do
    subject.choose_menu(menu)
    subject.cust_order("pie", 2)
    subject.cust_order("chips", 2)
    expect(subject.order_conf).to eq({ :pie => 2, :chips => 2 })
  end

  it "returns the bill" do
    expect(mockbill).to receive(:bill)
    subject.bill(bill_klass)
  end

end
