require 'menu'

describe Menu do

  it "checks it is not empty" do
    expect(subject.dishes).not_to be_empty
  end

  it "checks it is a list " do
    expect(subject.dishes).to eq([{ "spaghetti" => 5 }, { "meatball" => 6 }, { "pizza" => 7 }])
  end

end
