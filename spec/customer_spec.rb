require 'customer'

describe Customer do

  it "can view menu" do
    expect(subject.view_menu)
  end

  it "can view dishes and prices in menu hash" do
    expect(subject.view_menu)
  end

  it "can select dishes from menu that are saved as an order" do
    expect(subject.menu_selection)
  end

end
