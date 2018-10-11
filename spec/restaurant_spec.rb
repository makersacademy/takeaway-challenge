require 'restaurant'

describe Restaurant do

  let(:takeaway) { double :takeaway }

  it "displays the menu" do
    expect(subject.menu).to eq({
                                  "fish" => 10,
                                  "steak" => 20,
                                  "chips" => 4,
                                  "pie" => 12,
                                  "dessert" => 8
                                })
  end

  context "calculating the bill" do
    it "calculates the bill of the user's basket" do
      allow(takeaway).to receive(:basket) { { "fish" => 2 } }
      expect(subject.bill(takeaway.basket)).to eq 20
    end

    it "should ignore items not on the menu" do
      allow(takeaway).to receive(:basket) { { "fish" => 2, "lol" => 1 } }
      expect(subject.bill(takeaway.basket)).to eq 20
    end
  end

end
