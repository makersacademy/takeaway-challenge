require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, get: dish1}
  let(:dish1) { double :dish1, name: "dish1", price: 3.5}

  let(:order_log_class) {double :order_log_class, new: order_log}
  let(:order_log) {double :order_log, add: nil, total: 0}
  let(:contact_method_class) {double :contact_method_class, new: contact_obj}
  let(:contact_obj) {double :contact_obj, send: "msg"}


  subject(:takeaway) {Takeaway.new menu, order_log_class, contact_method_class}

  context "given name and quantity of a dish" do
    describe "#add_to_order" do
      it 'adds to order_log' do
        expect(order_log).to receive(:add).with("dish", 1)
        takeaway.add_to_order "dish", 1
      end
    end

    describe "#remove_from_order" do
      it 'removes from order_log' do
        expect(order_log).to receive(:remove).with("dish", 1)
        takeaway.remove_from_order "dish", 1
      end
    end
  end

  describe "#show" do
    it "by default shows menu" do
      expect(menu).to receive(:show)
      takeaway.show
    end

    it "if supplied with 'order' show order_log" do
      expect(order_log).to receive(:show)
      takeaway.show 'order'
    end

    it "raises error if supplied with anything else" do
      non_shower = "non_shower"
      expect{takeaway.show(non_shower)}.to raise_error{"That can not be shown"}
    end

  end

  context "no dishes added to order" do
    describe "checkout" do
      it 'raises eror if no dishes added' do
        expect{takeaway.checkout}.to raise_error{"nothing ordered yet"}
      end
    end
    describe "confirm_order" do
      it 'raises eror if no dishes added' do
        expect{takeaway.confirm_order 10}.to raise_error{"nothing ordered yet"}
      end
    end
  end

  context "dishes have been added to order" do
    let(:order_log) {double :order_log, add: nil, show: 'order', total: 10}
    before {takeaway.add_to_order "dish", 3}

    describe "checkout" do
      it "returns string showing order, total and confirm msg" do
        value = format("£%.2f",order_log.total)
        confirm = "To confirm please type 'confirm order' followed by the total"
        msg = "#{order_log.show}\n\nTotal: #{value}\n\n#{confirm}"
        expect(takeaway.checkout).to eq msg
      end
    end

    describe "confirm_order" do
      let(:contact_method) {double :contact_method}
      it "error if amount != order total" do
        msg = "Confirm with correct total of #{order_log.total}"
        expect{takeaway.confirm_order 9}.to raise_error{msg}
      end

      it "creates a sms obj if amount == order total" do
        msg = "#{order_log.show}"
        expect(contact_method_class).to receive(:new)
        takeaway.confirm_order 10
      end

      it "sends the sms obj with the order details" do
        msg = order_log.show
        expect(contact_obj).to receive(:send).with(msg)
        takeaway.confirm_order 10
      end

    end
  end
end
