require 'takeaway'
require 'order'

describe Order do

  let(:item_one) { {item: "Cheeseburger", price: 5} }
  let(:item_two) { {item: "Fried chicken", price: 4} }
  let(:takeaway_double) { double(:takeaway) }
  let(:text_service_double) { double(:text_service, :send_text => nil) }
  subject(:order) { Order.new(text_service_double) }

  it 'creates a new order' do
    expect(subject).to be_instance_of(Order)
  end

  it 'starts with an empty basket' do
    expect(subject.basket).to be_empty
  end

  describe '#add_to_basket' do
    it 'adds an item to the basket' do
      allow(takeaway_double).to receive(:select_item).with(2).and_return(item_one)
      subject.add_to_basket(takeaway_double, 2)
      expect(subject.basket).to eq [item_one]
    end

    it 'adds two items to the basket' do
      allow(takeaway_double).to receive(:select_item).with(2).and_return(item_one)
      allow(takeaway_double).to receive(:select_item).with(1).and_return(item_two)
      subject.add_to_basket(takeaway_double, 2)
      subject.add_to_basket(takeaway_double, 1)
      expect(subject.basket).to eq [item_one, item_two]
    end

    it 'allows adding multiple of an item to the basket' do
      allow(takeaway_double).to receive(:select_item).with(2).and_return(item_one)
      subject.add_to_basket(takeaway_double, 2, 3)
      expect(subject.basket).to eq [item_one, item_one, item_one]
    end
  end

  context 'basket has two items' do
    before :each do
      allow(takeaway_double).to receive(:select_item).with(2).and_return(item_one)
      allow(takeaway_double).to receive(:select_item).with(1).and_return(item_two)
      subject.add_to_basket(takeaway_double, 2)
      subject.add_to_basket(takeaway_double, 1)
    end

    describe '#print_basket' do
      it 'prints the current basket' do
        expect { subject.print_basket }.to output("Cheeseburger - £5\n" +
          "Fried chicken - £4\n"
        ).to_stdout
      end
    end

    describe '#basket_total' do
      it 'calculates the sum of the basket' do
        expect(subject.basket_total).to eq 9
      end
    end

    describe '#submit_order' do
      it 'raises an error message if order total does not match basket total' do
        expect { subject.submit_order(11) }.to raise_error("Total does not match")
      end

      it 'submits order if order total matches basket total' do
        expect(subject.submit_order(9)).to eq "Confirmation text sent"
      end

      it 'sends a text message confirming the order and delivery time' do
        subject.submit_order(9)
        expect(text_service_double).to have_received(:send_text).with("Thank you...")
      end
    end
  end
end
