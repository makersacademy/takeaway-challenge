require_relative '../lib/order'

describe Order do
  let(:menu_list_double)  { double :menu_list }
  let(:menu_class_double) { double :menu_class, new: menu_list_double }
  subject { described_class.new(menu_class: menu_class_double) }

  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:select) }
  it { is_expected.to respond_to(:see_order) }
  it { is_expected.to respond_to(:total) }

  describe "#select" do
    it "records a dish hash with price and qunatity into order_list" do
      allow(menu_list_double).to receive(:menu).and_return([{ dish: "dish", price: 1 }])
      expect(subject.select(1, 3)).to eq [{ item_and_price: { dish: "dish", price: 1 }, quantity: 3 }]
    end
  end
  describe "#see_order" do
    it "puts out order list" do
      allow(menu_list_double).to receive(:menu).and_return([{ dish: "dish1", price: 1 }, { dish: "dish2", price: 2 }])
      subject.select(1, 3)
      subject.select(2, 4)
      expect { subject.see_order }.to output("dish1, £1 x3\ndish2, £2 x4\n").to_stdout
    end
  end
  describe "#total" do
    it "puts out verified total to pay" do
      allow(menu_list_double).to receive(:menu).and_return([{ dish: "dish1", price: 1 }, { dish: "dish2", price: 2 }])
      subject.select(1, 3)
      subject.select(2, 4)
      expect { subject.total }.to output("total to pay: £11\n").to_stdout
    end
  end

end
