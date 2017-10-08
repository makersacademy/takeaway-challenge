require 'order'

describe Order do

  let(:menu) { double(:menu, menu_items: [{ item_num: 1, item: "Murgh Masala", cost: 6.9 }]) }
  let(:basket) { double(:basket, check_total: true, new_item: nil) }
  subject(:order) { described_class.new(menu, basket) }

  describe "#select_item" do

    it "accepts user input for item_num and item_quant" do
      allow($stdin).to receive(:gets).and_return("1\n")
      expect($stdin).to receive(:gets).twice
      order.select_item
    end

  end

  describe "#add_to_basket" do

    it "sends new item to basket" do
      allow($stdin).to receive(:gets).and_return("1\n")
      expect(basket).to receive(:new_item).with({ item: "Murgh Masala", quantity: 1, cost: 6.9 })
      order.select_item
    end

  end

  describe "#send_order" do

    it "raises error if order cost is incorrect" do
      allow(basket).to receive(:check_total).and_return(false)
      expect { order.send_order }.to raise_error("Error: order cost incorrect")
    end

    it "sends SMS order confirmation to customer" do
      text_alert_double = double(send_confirmation: nil)
      allow(TextAlert).to receive(:new).and_return(text_alert_double)
      expect(text_alert_double).to receive(:send_confirmation)
      order.send_order
    end
  end

end
