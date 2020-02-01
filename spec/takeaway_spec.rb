require "takeaway.rb"

describe Takeaway do
  describe " #order" do
    it "can order can accept one argument" do
      expect(subject).to respond_to(:order).with(1).argument
    end

    it "returns itme name from order" do
      expect(subject.order("Tikka Masala")).to eq "Tikka Masala"
    end

  end


# menu
# dishes

# basket

# text_providor

# read menu

# order ("name")

# basket_summary

# add (item, quantity)

# total

# checkout

end