require "./docs/takeaway.rb"

describe Menu do
  let(:list) { double :list }
  it "would like to list the menu" do
    expect(menu.read_menu).to include(:list)
  end
end
