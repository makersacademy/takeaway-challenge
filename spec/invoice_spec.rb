require 'invoice'
describe Invoice do
  let(:dish) {double(:dish)}
  let(:final_order) {[dish,dish]}
  let(:twilio_klass) {double :twilio_klass}
  let(:twilio) {double :twilio}
  subject(:invoice) {described_class.new(final_order,twilio_klass)}
  context "when an order has been completed" do
    before do
      allow(final_order).to receive(:current_order).and_return(dish,dish)
      allow(dish).to receive(:name).and_return(:mock_dish)
      allow(dish).to receive(:price).and_return(5)
    end

    it "should confirm the customer's order" do
      invoice.itemize_bill
       expect(invoice.confirmed_order).to eq({mock_dish: {quantity: 2, subtotal: 10}, total: 10})
    end

    it "instantiates a twilio messenger" do
      allow(twilio_klass).to receive(:new).and_return(twilio)
      expect(invoice.place_order).to eq twilio
    end
  end
end