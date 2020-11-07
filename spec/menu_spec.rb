require 'menu'

describe Menu do

  it "Is instance of the Menu class" do
    expect(subject).to be_instance_of(Menu)
  end

  it "Initializes with empty menu" do
    expect(subject.menu.length).to eq(0)
  end

  it "Has 15 items in menu after loading" do # this is a magic number
    subject.load_menu
    expect(subject.menu.length).to eq(15)
  end

end
