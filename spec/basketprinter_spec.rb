# todo:
# make user input to select dishes easier

require 'basketprinter'
describe BasketPrinter do
  let(:selection) { { chips: 1, curry: 3 } }
  let(:options) { { chips: 2, curry: 3.25 } }
  let(:basket) { BasketPrinter.new(selection, options) }
  let(:order_summary) { "Chips * 1, price = £2.00\nCurry * 3, price = £9.75\nTotal price = £11.75\nWould you like to proceed?" }
  describe "#initialize" do
    it "prints out formatted invoice for user to check" do
      allow($stdin).to receive(:gets).and_return('Yes')
      expect { basket }.to output(order_summary).to_stdout
    end
    it "cancels order if told to" do
      allow($stdin).to receive(:gets).and_return('No')
      expect { basket }.to output(order_summary + "\nYour order has not been placed").to_stdout
    end
  end
end
