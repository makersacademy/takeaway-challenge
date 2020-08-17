require 'order'

describe Order do

  it "is initialized with an empty array" do
    expect(subject.order).to eq([])
  end

  describe "#add" do
    it { is_expected.to respond_to(:add).with(3).arguments }

    it "pushes hash onto @order" do
      subject.add("spring rolls", 1, 1.99)
      item = { :item => "spring rolls", :quantity => 1, :price => 1.99 }
      expect(subject.order).to eq([item])
    end

    it "adds to quantity if item already exist in order" do
      subject.add("spring rolls", 1, 1.99)
      subject.add("spring rolls", 1, 1.99)
      item = { :item => "spring rolls", :quantity => 2, :price => 1.99 }
      expect(subject.order).to eq([item])
    end
  end

  describe "#view" do
    it "returns a print out of @order" do
      subject.add("spring rolls", 1, 1.99)
      expect(subject.view).to eq(subject.order)
      expect do
        subject.view
      end.to output("1x spring rolls....£1.99 each\n").to_stdout
    end
  end

  describe "#total" do
    it "returns sum of prices in @order" do
      subject.add("spring rolls", 2, 1.99)
      subject.add("noodles", 1, 2.99)
      expect(subject.total).to eq(6.97)
    end
  end
end
