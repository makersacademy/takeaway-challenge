require './lib/list.rb'
describe List do

  it "records the name of a dish" do
    expect(subject.dishes[0][1]).to eq 'Chow Mein'
  end
  it "records a the price of a dish" do
    expect(subject.dishes[0][:Price]).to eq 5.99
  end
end
