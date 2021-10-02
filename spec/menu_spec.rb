require 'menu'

describe Menu do
  it "gets initialised with an empty array" do
    subject = Menu.new
    expect(subject.menu.empty?).to eq true
  end
  it "has can add a dish" do
    subject.add_dish("Hamburger", 5)
    expect(subject.menu.length).to eq 1 
  end
  # it "can remove a dish" do
  #   subject.add_dish("Hamburger", 5)
  #   subject.add_dish("Ramen", 12)
  #   subject.remove_dish("Hamburger") 
  #   expect(subject.menu.length).to eq 1
  # end


end
