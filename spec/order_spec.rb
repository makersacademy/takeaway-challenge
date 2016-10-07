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
  #     expect(subject.summary).to include "Pasta"
  #   end
  # end

  describe "total_price" do
    it "should sum the order price" do
      subject.add(dish)
      subject.add(dish)
      expect(subject.total_price).to eq 7.00
    end
  end

end
