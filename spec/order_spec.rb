require 'order'

describe Order do
  let(:menu_list)  { double :menu_list }
  let(:menu_class) { double :menu_class, new: menu_list }
  subject { described_class.new(menu_class: menu_class) }

  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:select) }
  it { is_expected.to respond_to(:view_order) }
  it { is_expected.to respond_to(:total) }

  describe "#select" do
    it "saves an order selected with price and quantity into order_list" do
      allow(menu_list).to receive(:menu).and_return([{ dish: "Edamame", price: 3.95 }])
      expect(subject.select(1, 2)).to eq [{ item_and_price: { dish: "Edamame", price: 3.95 }, quantity: 2 }]
    end
  end

  describe "#view_order" do
    it "shows the order selected" do
      allow(menu_list).to receive(:menu).and_return([{ dish: "Edamame", price: 3.95 }, { dish: "Miso Soup", price: 4.95 }])
      subject.select(1, 2)
      subject.select(2, 4)
      expect { subject.view_order }.to output("Edamame £3.95 x2\nMiso Soup £4.95 x4\n").to_stdout
    end
  end

  describe "#total" do
    it "prints the total to pay to check" do
      allow(menu_list).to receive(:menu).and_return([{ dish: "Edamame", price: 3.95 }, { dish: "Miso Soup", price: 4.95 }])
      subject.select(1, 2)
      subject.select(2, 4)
      expect { subject.total }.to output("total to pay: £27.70\n").to_stdout
    end
  end
end
