require "menu"

describe Menu do
  it "has a menu" do
    expect(subject.list).to include({ name: "Margherita", price: 2 })
  end

  it "searches menu for dishes" do
    expect(subject.select("Margherita")).to eq({ name: "Margherita", price: 2 })
  end
end
