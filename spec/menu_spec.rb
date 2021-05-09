require "menu"

describe Menu do
  it "has a menu" do
    expect(subject.list.count).to eq 4
  end
end
