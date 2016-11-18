require 'order'

describe Order do

  subject(:order) { described_class.new(sms) }
  let(:pizza) { "pizza" }
  let(:ice_cream) { "ice_cream" }
  let(:sms) { double :SMS_class, send_message: 0 }

  it "should have a menu" do
    expect(order.menu).to be_kind_of Hash
  end

  it "should have a basket" do
    expect(order.basket).to be_kind_of Hash
  end

  describe '#add_to_basket' do
    it "should be able to add items to basket" do
      order.add_to_basket(pizza)
      expect(order.basket).to eq({pizza: 1})
    end

    it "should be able to add multiple items to the basket" do
      order.add_to_basket(ice_cream, 4)
      expect(order.basket).to eq({ice_cream: 4})
    end

    it "should not be able to add items that aren't on the menu" do
      expect{order.add_to_basket("Gorilla")}.to raise_error("Sorry, we don't have Gorilla")
    end
  end

  it "should be able to return the total" do
    order.add_to_basket(pizza)
    order.add_to_basket(ice_cream)
    expect(order.total).to eq 15.55
  end

  describe '#checkout' do
    before(:each) { order.add_to_basket(pizza) }

    it "should raise an error with the wrong total" do
      err_message = "Sorry, that was not the correct total"
      expect{order.checkout(999)}.to raise_error err_message
    end

    it "should send a confirmation text with the right total" do
      expect(sms).to receive(:send_message)
      order.checkout(10)
    end
  end
end
