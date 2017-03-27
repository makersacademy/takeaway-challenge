require 'takeaway'

describe Takeaway do


  let(:menu_class){ double :menu_class, new: menu }
  let(:menu){ double :menu, print: printed_list }
  let(:printed_list){"Spring rolls £3.50, Chicken £4.50"}
  let(:order_class){double :order_class, new: order}
  let(:order){double :order, total: 15}
  let(:sms){double :sms, send: nil}
  subject(:takeaway){described_class.new(menu, config: {}, order_class, sms)}

  before do
    takeaway.begin_order
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "displays a list of dishes with prices, so the customer can read_menu" do
    expect(takeaway.read_menu).to eq printed_list
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "selects a dish and places it in a basket, so the customer can place order" do
    expect(takeaway.order).to receive(:add)
    takeaway.add("Spring rolls", 1)
  end

  # it "displays the dishes in the basket that the customer has ordered" do
  #   takeaway.order(dish)
  #   takeaway.order(dish)
  #   expect(takeaway.view_basket).to eq [dish, dish]
  # end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "checks that the total price matches sum of various dishes in order, so that the customer can verify order" do
      allow(order).to receive(:total){15}
      expect(takeaway.place_order(15)).to raise_error "Price is incorrect"
    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it "sends sms confirmation to customer if price is correct" do
    allow(order).to receive(:total){15}
    subject.place_order(17)
    expect(sms).to have_received(:send)
  end

end
