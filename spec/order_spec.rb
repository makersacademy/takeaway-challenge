require "order"

describe Order do

  let(:subject)  { Order.new(menu) }
  let(:menu)     { double(:menu) }
  let(:result_1) { {icecream: 8} }
  let(:order_1)  { ["icecream", 4] }

  before(:each) do
    allow(menu).to receive(:menu_list).and_return(order_1)
  end
  it "check menu depnedancy" do
    expect(subject.menu_klass).to eq menu
  end

  it "has an order log" do
    expect(subject.order_log).to be_empty
  end

  describe "ordering food" do
    before(:each) do
      allow(menu).to receive(:price).and_return(4)
      2.times { subject.add_to("icecream", 4) }
    end

    it "allows an item, and quantity to be added" do
      expect(subject.order_log).to eq result_1
    end

    it "records a sum of food input" do
      expect(subject.sum).to eq [16, 16]
    end

    it "calculate the total cost" do
      expect(subject.total).to eq 32
    end
  end
end
