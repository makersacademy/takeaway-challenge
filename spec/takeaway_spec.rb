require "takeaway"

describe Takeaway do
  it "checks dishes as a Hash" do
    expect(subject.dishes).to be_a_kind_of(Hash)
  end

  it "prints the menu" do
    expect(subject.menu).to eq(subject.dishes)
  end

  it 'adding items to the order' do
    subject.choose("Miso Steak")
   expect(subject.order).to eq(["Miso Steak - £8.75"])
  end
end