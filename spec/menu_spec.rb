require 'menu'

# menu unit test

describe Menu do

  it "intialises with a default menu" do
    expect(subject.items).to eq Menu::DEFAULT_MENU
  end

  # match searches through the string to find I have put in the name of the dish
  # and the price of the dish somewhere in my output
  # this way this test will pass even if I change the formatting of the menu
  it "shows the menu in a pretty string" do
    Menu::DEFAULT_MENU.each { |key, value|
      expect(subject.show).to match key.capitalize
      expect(subject.show).to match value.to_s
    }
  end

end
