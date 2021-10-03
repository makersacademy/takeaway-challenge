require "order"

describe Order do
  let(:menu) { double "menu", :list => {
        1 => "cod £5",
        2 => "fishcake £4",
        3 => "chips £3"
      }}
    before(:each) do @order = Order.new(menu: menu)
    end
      
  describe "#see_menu" do
      
    it "returns a menu of dishes" do
      expect(@order.see_menu).to eq @order.menu.list
    end
  end

  describe "#place_order" do
    
    it "creates a list of selected dishes" do
      @order.place_order(1, 2)
      expect(@order.order).to eq @order.menu.list.slice(1, 2)
    end

    it "returns a total cost for the meal" do
      expect(@order.place_order(1, 2)).to eq 9
    end
  end

  describe "#verify_order" do
    it "shows the total alongside the dishes ordered" do
      @order.place_order(1, 2)
      expect(@order.verify_order).to eq "Your total is £#{@order.total} for the following #{@order.order}"
    end
  end

  describe "#confirm_order" do
    let(:fake_sms_sender) { double SmsSender, :send_text => true }
    it "creates a message confirming delivery before 1 hours time" do
      order = Order.new(sms_sender: fake_sms_sender)
      order.place_order(1, 2)
      t = Time.new
      hour_plus1 = ((t.strftime("%H").to_i) + 1)
      order.confirm_order
      expect(order.delivery_message).to eq "Thank you! Your order was placed and will be delivered before #{t.strftime("at #{hour_plus1}:%M%p")}"
    end

    it "uses the send_text method to send delivery_message" do
      order = Order.new(sms_sender: fake_sms_sender)
      expect(order.confirm_order).to be_truthy
    end
  end

  # describe "#sms_delivery_message" do
  #   let(:fake_sms_sender) { double 'sms_sender', :send_text => true }
  #   it "creates an instance of the SmsSender class with the argument 'delivery_message'" do
  #     expect(subject.sms_delivery_message(fake_sms_sender)).to be_truthy
  #   end
  # end

end
