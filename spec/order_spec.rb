require "order"

describe Order do

  let(:curry) { double :curry, :name => "curry", :price => 8.5 }
  let(:naan) { double :naan, :name => "naan", :price => 3 }

  it "should be able to add items to the order" do
    subject.add(curry)
    subject.add(naan)
    expect(subject.show).to match_array([curry, naan])
  end

  it "should be able to calculate the total" do
    subject.add(curry)
    subject.add(naan)
    expect(subject.total).to eq 11.5
  end

  it "should be able to check if the given total is the sum of all the dishes" do
    subject.add(curry)
    subject.add(naan)
    expect(subject.check_total).to be true
  end

end
