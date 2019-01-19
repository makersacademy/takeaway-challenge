require 'menu'

describe Menu do
  let(:item_fish) { double(:item, price: 8) }
  let(:item_class) { double(:item_class, new: item_fish) }
  let(:order) { double(:order, place_order: nil, order_total: item_fish.price, items: [item_fish]) }
  let(:order_class) { double(:order_class, new: order) }
  let(:formatter) { double(:formatter, format_items: "Fish --- £8", format_price: "£#{order.order_total}") }
  let(:formatter_class) { double(:formatter_class, new: formatter) }
  let(:text_message) { double(:text_message, send_message: true) }
  let(:text_class) { double(:text_class, new: text_message) }
  let(:subject) { Menu.new(["fish"], item_class, formatter_class, order_class, text_class) }

  describe '#initialize' do
    it 'should initialize with a list of item names' do
      expect(subject.names).to eq ["fish"]
    end

    it 'should create items on initialization' do
      expect(subject.items).to eq [item_fish]
    end
  end

  describe '#print_menu' do
    it 'should run formatter' do
      expect(formatter).to receive(:format_items)
      subject.print_menu
    end

    it 'should return a formatted menu' do
      expect(subject.print_menu).to eq "Fish --- £8"
    end
  end

  describe '#user_input' do

    before(:each) do
      subject.stub(:gets).and_return("Fish", "1", "Yes")
    end

    it 'should not loop if final answer is yes' do
      expect(subject.user_input).to eq nil
    end

    it 'should loop until if final answer is yes' do
      subject.stub(:gets).and_return("Fish", "1", "No", "Fish", "1", "Yes")
      expect(subject.user_input).to eq nil
    end

    it 'should add the item to orders' do
      expect(order).to receive(:place_order)
      subject.user_input
    end

    # it 'should run order object' do
    #   expect(order).to receive(:place_order)
    #   subject.place_order(item_fish)
    # end
  end

  describe 'view order details' do

    describe '#return_order_total' do
      it 'should run order object' do
        expect(order).to receive(:order_total)
        subject.return_order_total
      end

      it 'should return the order total' do
        expect(subject.return_order_total).to eq "£8"
      end
    end

    describe '#confirm_order_breakdown' do
      let(:false_order) { double(:false_order, order_total: 1, items: [item_fish]) }
      let(:false_order_class) { double(:false_order_class, new: false_order) }
      let(:false_formatter) { double(:false_formatter, format_price: "£#{false_order.order_total}") }
      let(:false_formatter_class) { double(:false_formatter_class, new: false_formatter) }
      let(:false_total_subject) { Menu.new(["fish"], item_class, false_formatter_class, false_order_class) }

      it 'should run the order object on recount' do
        expect(order).to receive(:items)
        subject.confirm_order_breakdown
      end

      it 'should return true if order total is correct' do
        expect(subject.confirm_order_breakdown).to eq true
      end

      it 'should return error message if there is a miscalculation' do
        expect { false_total_subject.confirm_order_breakdown } .to raise_error "Calculation broken"
      end
    end

    describe '#confirm_order' do
      it 'should run text message class' do
        expect(text_message).to receive(:send_message)
        subject.confirm_order
      end
    end
  end
end
