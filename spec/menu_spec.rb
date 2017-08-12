require 'menu'

describe Menu do

  it "shows the dishes and prices" do
    expect(subject.display).to eq ("King's Fired Rice £88\n
    Secret Roast Goose £322\n
    Sorrowful Rice £696\n
    Buddha Jumping Wall £122\n
    Beef Balls £155\n
    Pissing Shrimp £162\n
    Pissing Beef Balls £299")
  end
end
