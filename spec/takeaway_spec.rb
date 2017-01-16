require "takeaway"

describe Takeaway do

  let(:menu) { instance_double("Menu") }
  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }
  let(:dishes) { [pepperoni, hawaiian, meat_feast] }
  let(:order) { instance_double("Order") }
  let(:array_printer) { class_double("ArrayPrinter") }
  let(:order_total_checker) { class_double("OrderTotalChecker") }
  let(:order_class) { class_double("Order") }
  let(:test_sms_messager_class) { double("SMSMessagerTestClass") }
  let(:test_sms_messager) { double("SMSMessagerTest") }
  let(:twilio_client) { double("TwilioClient") }
  let(:twilio_client_messages) { double("Messages") }
  let(:args) { {:menu => menu,
                :printer_module => array_printer,
                :order_class => order_class,
                :order_total_checker => order_total_checker,
                :sms_messager => test_sms_messager_class} }
  subject(:takeaway) { described_class.new(args) }
  before(:each) do
    allow(order_class).to receive(:new) { order }
    allow(test_sms_messager_class).to receive(:new) { test_sms_messager }
    allow(array_printer).to receive(:print_array) { print "string" }
  end
  describe "#initialize" do
    it { is_expected.to respond_to(:menu) }
  end

  describe "#show_menu" do
    it { is_expected.to respond_to(:show_menu) }
    it "results in a printed string from the printer_module" do
      allow(menu).to receive(:dishes) { [pepperoni, hawaiian, meat_feast] }
      expect{takeaway.show_menu}.to output("string").to_stdout
    end
  end

  describe "#place_order" do
    before(:each) do
      allow(pepperoni).to receive(:price) { 5 }
      allow(hawaiian).to receive(:price) { 10 }
      allow(meat_feast).to receive(:price) { 15 }
      allow(order).to receive(:ordered_dishes) { { pepperoni => 3, hawaiian => 2, meat_feast => 4 } }
      allow(test_sms_messager).to receive(:message) { true }
      allow(test_sms_messager).to receive(:client) { twilio_client }
      allow(twilio_client).to receive(:messages) { twilio_client_messages }
      allow(twilio_client_messages).to receive(:create) { true }
    end
    it "raises error if expected order total is wrong" do
      allow(order_total_checker).to receive(:check_total) { false }
      allow(order).to receive(:expected_order_total) { 9000 }
      expect{takeaway.place_order(order)}.to raise_error(RuntimeError, "Your expected total order cost is wrong!")
    end
    it "prints confirmation message if order total check passes" do
      allow(order_total_checker).to receive(:check_total) { true }
      allow(order).to receive(:expected_order_total) { 95 }
      message = "Your order has been accepted, you will receive a text message confirmaton shortly!"
      expect{takeaway.place_order(order)}.to output(message).to_stdout
    end
  end

  describe "#new_order" do
    it "returns an order object" do
      expect(takeaway.new_order).to eq order
    end
    it "passes the menu object to order's :menu" do
      allow(order).to receive(:menu) { menu }
      takeaway.new_order
      expect(order.menu).to eq menu
    end
  end

end
