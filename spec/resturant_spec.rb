require 'resturant'

describe Resturant do
  subject { Resturant.new(menu_class) }

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu) }
  let(:order_class) { double(:order_class, new: order)}
  let(:order) { double(:order) }

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

  end

end
