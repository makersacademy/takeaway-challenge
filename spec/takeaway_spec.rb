require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }

  before { allow(subject).to receive(:send_text) }
  # let(:order) { double :order}

  describe '#view_menu' do
    it 'shows list of menu items' do
      skip
      expect(subject.view_menu).to eq menu
    end
  end

  describe '#add' do
    before do
      dish = "Hummus"
      qty = 2
      subject.add(dish, qty)
    end

    it 'raises error if menu item does not exist' do
      expect { subject.add(nil, nil)}.to raise_error "Menu item does not exist"
    end

    it 'adds dish name to order' do
      expect(subject.order.details[0][:name]).to eq "Hummus"
    end

    it 'adds dish price to order' do
      expect(subject.order.details[0][:price]).to eq 5
    end

    it 'adds dish quantity to order' do
      expect(subject.order.details[0][:qty]).to eq 2
    end
  end

  describe '#submit_order' do

    before do
      dish = "Hummus"
      qty = 2
      subject.add(dish, qty)
    end

    it { is_expected .to respond_to(:submit_order).with(1).argument }

    it 'raises error if payment input does not equal order total' do
      # subject.add("Hummus", 5)
      expect { subject.submit_order(nil) }.to raise_error "Payment does not match order total"
    end

    it 'if payment is correct, returns order total' do
      p subject.order.total
      expect(subject.submit_order(10)).to eq "Total: $ 10"
    end

    it 'sends text with order details' do
    end
  end

end
