require 'restaurant'

describe Restaurant do
  subject { Restaurant.new(menu_class) }

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu, show_menu: nil) }
  let(:order_class) { double(:order_class, new: order) }
  let(:order) { double(:order, view_order: "chicken x2 £15.00\nTotal: £15.00\n") }

  it 'set the menu_class to menu on initialize' do
    expect(subject.menu).to eq(menu)
  end

  it 'starts with no orders to cook' do
    expect(subject.orders_to_cook).to be_empty
  end

  it 'responds to view_menu' do
    expect(subject).to respond_to(:view_menu)
  end

  context 'order not started errors' do

    it 'will raise an error if trying to view order before starting order' do
      expect { subject.view_order }.to raise_error("order not started")
    end

    it 'will raise an error if trying to view order before starting order' do
      expect { subject.remove_from_order(:chicken) }.to raise_error("order not started")
    end

    it 'will not let you add to order if order not started' do
      expect { subject.add_to_order(:chicken, 2) }.to raise_error("order not started")
    end

  end

  context 'ordering' do

    before do
      subject.start_order(order_class)
      allow(subject).to receive(:delivery)
      allow(subject).to receive(:user_input) { "Y" }
    end

    it 'should cancel and order' do
      subject.cancel_order
      expect(subject.order).to be_nil
    end

    it 'sets order to a new instance of order_class' do
      subject.start_order(order_class)
      expect(subject.order).to eq(order)
    end

  end

  context 'checkout_process' do

    before do
      subject.start_order(order_class)
      allow(subject).to receive(:delivery)
      allow(subject).to receive(:user_input) { "Y" }
    end

    it 'should show order and total cost before checkout' do
      message = "Order:\nProceed with checkout?(Enter Y to proceed)\n"
      expect { subject.checkout }.to output(message).to_stdout
    end

    it 'should set @order to nil' do
      subject.checkout
      expect(subject.order).to be_nil
    end

    it 'should move the order to orders_to_cook' do
      subject.checkout
      expect(subject.orders_to_cook).to include(order)
    end

  end

end
