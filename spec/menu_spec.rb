require './lib/menu'

describe Menu do

  it "check that it is possible to display the contents of the menu" do
    expect(subject.display).to eq true
  end

  it "returns true if a dish is in the menu" do
    expect(subject.include?("spring roll")).to eq true
  end
   
  it "returns false if a dish is not in the menu" do
    expect(subject.include?("cheesecake")).to eq false
  end

  it "returns price of 0.99 if the choice is spring roll" do
    expect(subject.get_price("spring roll")).to eq 0.99
  end
end
