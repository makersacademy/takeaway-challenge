require "order"

describe Order do

  let(:subject) { described_class.new( { items: { rice: 2, tofu: 10 }, total: 10.99 } )}

  it "contains list of ordered items" do
    expect(subject).to respond_to(:ordered_items)
  end

  describe "#ordered_items" do

    it 'is initalized with items and quanity' do
      expect(subject.ordered_items).to eq({ rice: 2, tofu: 10 })
    end
  end

  describe "#total" do

    it "is initialized with total" do
      expect(subject.total).to eq(10.99)
    end
  end
end