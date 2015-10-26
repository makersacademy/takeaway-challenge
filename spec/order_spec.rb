require 'order'

describe Order do

  let(:menu) {double(:menu)}
  let(:dish) {double(:dish)}
  let(:invoice) {double(:invoice)}
  let(:invoice_klass) {double(:invoice_klass)}
  let(:twilio_klass) {double(:twilio_klass)}
  subject(:order) {described_class.new(menu,invoice_klass,twilio_klass)}

  before(:each) do
    allow(menu).to receive(:select_dish).and_return(dish)
    allow(dish).to receive(:price).and_return(5)
  end

  it "initializes with a menu" do
    expect(order.menu).to eq menu
  end

  context "when placing an order" do
    describe "#choose_item" do
      it "adds a dish to the order" do
        order.choose_item(dish)
        expect(order.current_order).to include(dish)
      end
      it "supports multiple quantities of a given item" do
        order.choose_item(dish,2)
        expect(order.current_order).to contain_exactly(dish,dish)
      end

    describe "#order_total" do
      it "correctly calculates the total value of the order" do
        3.times{order.choose_item(dish)}
        expect(order.order_total).to eq 15
      end
    end

  context "finalising an order" do
    describe "#confirm_order" do
      it "initializes an invoice instance, passing it the final order" do
        allow(invoice_klass).to receive(:new).with(order.current_order,twilio_klass).and_return(invoice)
        allow(invoice).to receive(:itemize_bill)
        order.confirm_order
        expect(order.invoice).to eq invoice
      end

    end
  end

    end
  end
end