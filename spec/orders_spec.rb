require 'orders'

describe Orders do

  let(:menu) { double :menu }

  it 'chooses the menu' do
    subject.choose_menu(menu)
    expect(subject.choose_menu(menu)).to eq menu
  end

  it 'responds to 2 arguments' do
    expect(subject).to respond_to(:cust_order).with(2).arguments
  end

  it "can place multiple orders" do
    subject.cust_order("pie", 3)
    subject.cust_order("chips", 2)
    expect(subject.orders).to eq({ pie: 3, chips: 2 })
  end

  it "raises an error if dish is not on the menu" do
    expect { subject.cust_order('chicken', 2) }.to raise_error "sorry, dish is not available"
  end

  it "confirms customer order" do
    subject.cust_order("pie", 2)
    subject.cust_order("cranberry juice", 2)
    expect(subject.order_conf).to eq({ :pie=>2, :cranberry_juice=>2 })
  end

  it 'returns the bill' do
    subject.choose_menu
    subject.cust_order("pie", 2)
    subject.cust_order("cranberry juice", 2)
    expect(subject.bill).to eq 14
  end

end
