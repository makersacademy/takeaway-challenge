require 'order'

describe Order do

  subject(:order)       { described_class.new }
  let(:selection)       { double "a hash of selections" }
  let(:provided_total)  { double "the total provided" }

  it "initializes with a menu hash" do
    expect(order.menu).to be_instance_of Hash
  end

  it "initializes with an empty selection hash" do
    expect(order.selection).to eq({})
  end

  describe "#add" do
    let!(:correct_item)   { order.menu.keys.sample }
    let(:incorrect_item)  { double("an incorrect item", to_sym: :"an incorrect item") }
    let(:quantity)        { 3 }
    context "when item is part of menu" do
      context "when item has been chosen in this order before" do
        before :each do
          order.add(correct_item, 1)
        end

        it "adds correct number of correct item to @selection" do
          expect { order.add(correct_item, quantity) }.to change { order.selection[correct_item] }.by quantity
        end
      end

      context "when item is chosen for the first time in this order" do
        it "adds correct number of correct item to @selection" do
          expect(order.add(correct_item, quantity)).to eq quantity
        end
      end
    end

    context "when item is not part of menu" do
      it "raises 'Item not on menu' error" do
        expect { order.add(incorrect_item, quantity) }.to raise_error "Item not on menu"
      end
    end
  end
  #
  # describe "#select_menu_items" do
  #   let(:test_order)            { order.menu }
  #   let(:test_order_total) {
  #     order.menu.each_value.map { |v| v**2 }.inject(&:+)
  #   }
  #   let(:correct_order) {
  #     order.select_menu_items(test_order, test_order_total)
  #   }
  #   let(:incorrect_test_order_total) { test_order_total - 1 }
  #   let(:incorrect_order) {
  #     order.select_menu_items(test_order, incorrect_test_order_total)
  #   }
  #
  #   context "when provided_total is incorrect" do
  #
  #     it "raises 'Incorrect total provided' error" do
  #       expect { incorrect_order }.to raise_error "Incorrect total provided"
  #     end
  #   end
  #
  #   context "when provided_total is correct" do
  #     context "using an example order" do
  #       it "does not raise error" do
  #         expect { correct_order }.not_to raise_error
  #       end
  #     end
  #
  #     context "using a double of an order" do
  #       before :each do
  #         allow(order).to receive(:validate).and_return nil
  #       end
  #
  #       it "stores the estimated total in @provided_total" do
  #         expect { order.select_menu_items(selection, provided_total) }
  #           .to change { order.provided_total }.to provided_total
  #       end
  #
  #       it "stores the selection in @selection" do
  #         expect { order.select_menu_items(selection, provided_total) }
  #           .to change { order.selection }.to selection
  #       end
  #     end
  #   end
  # end

  describe "#send_sms" do
    let(:messaging_service) { double("a messaging service") }
    let(:phone_number)      { double("a phone number") }
    let(:body)              { double("a string") }
    it "calls TwilioSendSMS::send_sms" do
      allow(messaging_service).to receive(:send_sms)
      expect(messaging_service).to receive(:send_sms).with(phone_number, order.sms_body)
      order.send_sms(messaging_service, phone_number)
    end
  end

  describe "#sms_body" do
    it "returns the correct message" do
      message = "Thank you for your order. "\
      "It will be delivered at #{Time.now.strftime "%H:%M"}"
      expect(order.sms_body).to eq message
    end
  end
end
