require_relative "../lib/User"

describe User do
  let(:menu) {double(:menu,{starters: {"Soup" => ["Soup",3.99], "Salad" => ["Salad",4.99]}})}

  it "has an empty basket when initialized" do
     expect(subject.basket).to eq []
  end

  it "can add to the basket" do
    subject.add(menu.starters["Soup"])
    expect(subject.basket).to include("Soup")
  end

  it "has a running total in the basket" do
    subject.add(menu.starters["Soup"])
    expect(subject.total).to eq 3.99
  end

  context "when checking out" do
    
    xit "an item summary is displayed" do
      subject.add(menu.starters["Soup"])
      expect(subject.checkout).to eq "1 items in your basket, total £3.99"
    end

    it "a text message is sent" do
      subject.checkout_complete
      expect(subject.sent).to eq true
    end

  end

end