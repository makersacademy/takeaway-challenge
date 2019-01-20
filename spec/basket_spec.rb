# todo:
# make user input to select dishes easier
# rename to basket class

require 'basket'
describe Basket do
  let(:selection) { [ { name: "Chips", quantity: 1}, { name: "Curry", quantity: 3 } ] }
  let(:options) { [ {name: "Chips", price: 2}, {name: "Curry", price: 3.25 } ] }
  let(:basket) { Basket.new(selection, options) }
  let(:message_sender_class) { double(:message_sender_class, new: nil)}
  let(:order_summary) { "Chips * 1, price = £2.00\nCurry * 3, price = £9.75\nTotal price = £11.75\nWould you like to proceed?" }

  describe "#print_invoice" do
    it "shows invoice and cancels order if told to" do
      allow($stdin).to receive(:gets).and_return('No')
      expect { basket.print_invoice(message_sender_class) }.to output(order_summary + "\nYour order has not been placed").to_stdout
    end
    # it "shows invoice and creates new message sender instance if user confirms" do
    #   allow($stdin).to receive(:gets).and_return('Yes')
    #   expect(message_sender_class).to receive(:new)
    #   basket.print_invoice(message_sender_class)
    # end
  end
end
