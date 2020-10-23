require_relative '../lib/order'

describe Order do
  let(:menu_list_double)  {double :menu_list}
  let(:menu_class_double) {double :menu_class, new: menu_list_double}
  subject {described_class.new(menu_class: menu_class_double)}

  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:select) }
  it { is_expected.to respond_to(:order_list) }

  describe "#select" do
    it "records a dish hash with price and qunatity into order_list" do
      allow(menu_list_double).to receive(:menu).and_return([{dish:"dish", price: 1}])
      expect(subject.select(1, 3)).to eq [{:item_and_price=>{dish:"dish", price: 1}, :quantity=>3}]
    end
  end
end
