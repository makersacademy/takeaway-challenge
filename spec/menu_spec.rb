require "./lib/menu.rb"

describe Menu do
  let(:dishes) { double :dishes, empty?: true }

  it "shows the Menu class to have @dishes" do
    expect(subject).to respond_to :dishes
  end

  it "shows the Menu class to have a method read_menu" do
    expect(subject).to respond_to :read_menu
  end

  it "shows menu dishes not to be empty" do
    expect(subject.read_menu.empty?).to eq(false)
  end

  it "shows menu dishes to be empty" do
    subject = described_class.new(dishes)
    expect(subject.read_menu).to eq("the menu is empty")
  end

end
