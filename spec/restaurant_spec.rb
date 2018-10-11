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

  it "calculates the bill of the user's basket" do
    allow(takeaway).to receive(:basket) { { "fish" => 2 } }
    expect(subject.bill(takeaway.basket)).to eq 20
  end
end
