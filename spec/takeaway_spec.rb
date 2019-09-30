require 'takeaway'
require 'menu'

describe Order do
  let(:menu) { double :menu, item_on_menu?: true, items: item }
  let(:subject) { Order.new }
  let(:item) { { "bread" => 1, "meatballs" => 5 } }

  describe '#add_items' do
    it 'adds food requests to basket array' do
      subject.add_items "meatballs", 1
      expect(subject.basket.size).to_not eq 0
    end

    it 'returns the total cost' do
      expect(subject.add_items("meatballs", 2)).to eq 10
    end
  end

  describe '#calculate_total' do
    it 'calculates the total bill' do
      subject.add_items "meatballs", 2
      expect(subject.total).to eq 10
    end
  end

  describe '#print_order' do
    it 'prints out the order' do
      subject.add_items "meatballs", 2
      subject.add_items "bread", 1
      expect { subject.print_order }.to output("2 x meatballs\n1 x bread\n").to_stdout
    end
  end
end

# # write mock to call pretend number via Twilio
