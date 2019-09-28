require 'order'

describe Order do

  let(:menu) { double("Menu") }

  describe '#initialize' do
    it 'total_order list exists and is empty' do
      expect(subject.total_order).to be_empty
    end
  end

  describe '#read_menu' do
    it 'lists the items and prices on the menu' do
      expect do
        subject.read_menu
      end.to output("pizza: £8.0\nburger: £5.0\nchips: £2.0\nfish: £6.0\nfalafel_wrap: £4.5\n").to_stdout
    end
  end

  describe '#add_item' do

    it 'adds 3 chips to the order and returns a message to the customer' do
      expect do
        subject.add_item(:chips, 3)
      end.to output("chips x3 added to your basket\n").to_stdout
    end

    it 'adds 1 pizza and 2 kebabs to the order' do
      subject.add_item(:pizza)
      subject.add_item(:burger, 2)
      expect(subject.total_order).to eq [{ pizza: 1 }, { burger: 2 }]
    end
  end

  describe '#order_summary' do

    it { is_expected.to respond_to :order_summary }

    context 'customer orders 2x pizza, 3x chips, 1x burger' do
      it 'shows the customers their list of dishes, quantity, price and total cost' do
        subject.add_item(:pizza, 2)
        subject.add_item(:chips, 3)
        expect do
          subject.order_summary
        end.to output("pizza x2 = £16.0, chips x3 = £6.0\nYour total cost for this order is £22.0\n").to_stdout
      end
    end
  end

  describe '#total_basket' do
    it { is_expected.to respond_to :total_basket }
  end

  describe '#check_out' do

    it { is_expected.to respond_to :check_out }

    it 'raises an error if expected_cost does not equal calculated cost' do
      subject.add_item(:pizza)
      subject.order_summary
      message = "Difference between expected cost and calculated cost"
      expect { subject.check_out(6.0) }.to raise_error(message)
    end

    it 'directs customer to place order if order is correct' do
      subject.add_item(:pizza)
      subject.order_summary
      message = "Press 'Place Order' to submit your order through to the restaurant"
      expect(subject.check_out(8.0)).to eq message
    end
  end

end
