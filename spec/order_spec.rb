require 'order'

describe Order do
  let(:menu_items) { 
    { "egg fried rice" => 2,"special fried rice" => 2,"prawn toast" => 2,
      "chicken balls" => 2.5,"spring rolls" => 2.5,"char siu pork" => 3,
      "beef chow mein" => 3.5,"spare ribs" => 3.5 }
   }

  describe '#add_item' do
    it 'should take 2 arguments - item and amount and add to orders array' do
      subject.add_item("egg fried rice")
      subject.add_item("beef chow mein", 2)
      expect(subject.order).to eq(["1x egg fried rice ordered (£2)", "2x beef chow mein ordered (£7.0)"])
    end
  end

  describe '#calculate_total' do
    it 'should add prices to total' do
      subject.add_item("egg fried rice", 2)
      subject.add_item("char siu pork")
      subject.add_item("spare ribs")
      expect(subject.total).to eq(10.5)
    end
  end

  describe '#show_order_summary' do
    it 'should return order summary (amount of item with price) and total price' do
      subject.add_item("egg fried rice", 2)
      subject.add_item("char siu pork")
      subject.add_item("spare ribs")
      expect(subject.show_order_summary).to eq("2x egg fried rice ordered (£4), 1x char siu pork ordered (£3), 1x spare ribs ordered (£3.5)\nTotal: £10.5")
    end
  end
end
