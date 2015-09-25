require 'customer'
require 'vcr'

describe Customer do

  let(:order){ double :order, empty?: false }
  subject { Customer.new(order) }

  include_examples 'menu'

  it "can see the menu" do
    expect(subject.list_of_dishes).to eq({pizza: 12.99, potato_wedges: 3.99, nachos: 3.99,
    chicken_wings: 8.99, dip: 0.49})
  end

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

  it "a message is sent if the order is ok" do
    allow(order).to receive(:total).and_return(35)
    expect(subject).to receive(:send_text)
    subject.place_order({pizza: 2}, 35)
  end

  it "receives a message after the order is placed" do
    VCR.use_cassette(subject) do
      response = subject.send_text
      expect(response.body).to eq "Thank you! Your order was placed and will be delivered by #{(Time.now + 60*60).strftime('%H:%M')}"
    end
  end

end