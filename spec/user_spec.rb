require_relative "../lib/User"

describe User do
  let(:menu) {double(:menu,{starters: {"Soup" => ["Soup",3.99], "Salad" => ["Salad",4.99]}})}

  it { is_expected.to respond_to(:add) }
  it { is_expected.to respond_to(:summary) }
  it { is_expected.to respond_to(:basket) }
  it { is_expected.to respond_to(:total) }
  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:checkout) }
  it { is_expected.to respond_to(:checkout_complete) }

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

  it "can view a summary of their basket" do
    subject.add(subject.menu.starters["Soup"])
    expect(subject.summary).to eq "1 items in your basket, total £3.99"
  end

  context "when checking out" do

    it "checks user input against basket total" do
      subject.add(subject.menu.starters["Soup"])
      expect{subject.checkout(1.99)}.to raise_error "Error - Payment value does not match basket total"
    end

  end

end

