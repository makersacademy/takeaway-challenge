require "order"

describe Order do

  let(:subject) { described_class.new( { items: { rice: 2, tofu: 10 }, total: 10.99 , contact_number: "+4407572437603"}  )}

  it "contains list of ordered items" do
    expect(subject).to respond_to(:ordered_items)
  end

  it "contains contact number" do
    expect(subject.contact_number).to eq("+4407572437603")
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