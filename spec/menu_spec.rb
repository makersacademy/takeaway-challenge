require 'menu'

describe Menu do
  it "should load menu" do
    subject.load_menu
    expect(subject.menu).to include("Tofish Bites": 6)
  end
end
