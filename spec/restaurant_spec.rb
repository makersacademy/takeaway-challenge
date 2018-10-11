require 'restaurant'

describe Restaurant do
  it "displays the menu" do
    expect(subject.menu).to eq({ Fish: 10 })
  end
end
