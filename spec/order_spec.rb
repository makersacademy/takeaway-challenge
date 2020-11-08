require 'order'

describe Order do
  let(:menu_list)  { double :menu_list }
  let(:menu_class) { double :menu_class, new: menu_list }
  subject { described_class.new(menu_class: menu_class) }

  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:select) }

  describe "#select" do
    it "saves an order selected with price and quantity into order_list" do
      allow(menu_list).to receive(:menu).and_return([{ dish: "Edamame", price: 3.95 }])
      expect(subject.select(1, 2)).to eq [{ item_and_price: { dish: "Edamame", price: 3.95 }, quantity: 2 }]
    end
  end
end
