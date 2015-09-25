require 'customer'

describe Customer do

  let(:order){ double :order, empty?: false }
  subject { Customer.new(order) }

  include_examples 'menu'

  it "can add dish" do
    expect(order).to receive(:add_dish).with(:pizza,1)
    subject.add_dish(:pizza,1)
  end

  it "can check if given total equals to order's total" do
    allow(order).to receive(:total).and_return(35)
    expect(subject.total_correct(35)).to eq(true)
  end

  it "can not place an order if it is empty" do
    expect{subject.place_order({}, 0)}.to raise_error "Order is empty"
  end

  it "can not place an order if total is wrong" do
    allow(order).to receive(:total).and_return(35)
    expect{subject.place_order({dip: 2},3)}.to raise_error "Total is not correct"
  end

  it "knows the list of ordered dishes" do
    allow(order).to receive(:dishes).and_return(pizza: 1)
    expect(subject.my_list).to eq(pizza: 1)
  end

  # it "receive a message if order is ok" do
  #   allow(order).to receive(:total).and_return(35)
  #   twilio_text = double :twilio_text
  #   allow(twilio_text).to receive(:send_text).and_return("Text sent!")
  #   cust = Customer.new(order, twilio_text)
  #   expect(cust.place_order({'pizza'=>2}, 35)).to eq("Text sent!")
  # end

end