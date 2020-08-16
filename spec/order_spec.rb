require 'order'

describe Order do

  it "is initialized with an empty array" do
    expect(subject.order).to eq([])
  end

  describe "#add" do
    it { is_expected.to respond_to(:add).with(3).arguments }

    it "pushes hash onto @order" do
      subject.add("spring rolls", 1, 1.99)
      item = { :item => "spring rolls", :quantity => 1, :price => "£1.99 each" }
      expect(subject.order).to eq([item])
    end
  end

  describe "#view}" do
    it "returns a print out of @order" do
      subject.add("spring rolls", 1, 1.99)
      expect(subject.view).to eq(subject.order)
      expect do
        subject.view
      end.to output("1x spring rolls....£1.99 each\n").to_stdout
    end
  end
end
