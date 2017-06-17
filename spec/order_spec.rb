
require_relative "../lib/order"

describe Order do

    subject(:order) { described_class.new(order_printer) }
    let(:order_printer) { double(:order_printer) }


       describe "attributes" do
        it {is_expected.to respond_to(:printer)}
        it {is_expected.to respond_to(:total)}
        it {is_expected.to respond_to(:basket)}
      end

end
