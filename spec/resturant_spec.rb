require 'resturant'
require 'stringio'

describe Resturant do
  subject { Resturant.new(menu_class) }

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu) }
  let(:order_class) { double(:order_class, new: order)}
  let(:order) { double(:order, view_order: "chicken x2 £15.00\nTotal: £15.00\n") }

  context 'ordering' do

    before do
      subject.start_order
    end

    it 'should cancel and order' do
      subject.cancel_order
      expect(subject.order).to be_nil
    end

    it 'will not let you add to order if order not started' do
      subject.cancel_order
      expect { subject.add_to_order(:chicken, 2)}.to raise_error("order not started")
    end

    context 'checkout'

    before do
      STDIN = StringIO.new("N")
    end

    it 'should show order and total cost before checkout' do
      message = "Order:\nProceed with checkout?(Enter Y to proceed)\n"
      expect { subject.checkout }.to output(message).to_stdout
    end

  end

end
