require 'order'

describe Order do
  subject {described_class.new}
  dish = {name: "Pasta", price: 3.50}

  it {is_expected.to respond_to(:add).with(1).argument}

  describe "#add" do
    it "should add dishes to order" do
      subject.add(dish)
      expect(subject.summary).to eq [dish]
    end
  end
end
