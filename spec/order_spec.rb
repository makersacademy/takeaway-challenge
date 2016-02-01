require 'order'

describe Order do

  let(:menu_klass) {double :menu_klass}
  let(:menu) {double :menu}

  subject(:order) {described_class.new}

  before do
    allow(menu).to receive(:new)
    allow(menu).to receive(:duplicate_menu).and_return :item_1 => 2, :item_2 => 2
    subject.select_meal(:item_1)
    subject.select_meal(:item_2)
  end

  describe '#display_menu' do
    it 'displays a menu' do
      expect(subject.display_menu).to eq :item_1 => 2, :item_2 => 2
    end
  end

  describe '#select_meal' do
    it "should reject meals not listed on the menu" do
      expect{subject.select_meal :item_3 }.to raise_error "Please select a dish from the menu."
    end
    it "a valid dish should be added to my order" do
      expect{order.my_order}.to eq :item_1 => 1, :item_2 => 1
    end
  end

  describe "#totaliser" do
    it "should calculate the cost of your meal." do

    end
  end
end
