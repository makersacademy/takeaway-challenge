require 'order'

describe Order do
  subject {described_class.new}
  dish = {name: "Pasta", price: 3.50}

  it {is_expected.to respond_to(:add).with(1).argument}

  describe "#add" do
    it "should add dishes to order" do
      subject.add(dish)
      expect(subject.selections).to eq [dish]
    end
  end

  # describe "#summary" do
  #   it "should summarise the order so far" do
  #     subject.add(dish)
  #     expect(subject.summary["Total price is"]).to eq "Total price is"
  #   end
  # end

  describe "total_bill" do
    it "should sum the order bill" do
      subject.add(dish)
      subject.add(dish)
      expect(subject.total_bill).to eq (2*dish[:price])
    end
  end

end
