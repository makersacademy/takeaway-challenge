require 'menu'

describe Menu do

  it "allows me to see a new menu" do
    expect(subject).to eq subject
  end

  it "allows me to list the items and prices on a menu" do
    expect(subject.italian).to eq "Pizza" => 10
  end

end
