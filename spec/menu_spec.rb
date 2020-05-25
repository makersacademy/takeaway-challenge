require 'menu'

describe Menu do

  it "has a menu which can be read by the user" do
    expect(subject).to be_kind_of(Menu)
  end

  it "is the place the menu is stored" do
    expect(subject.menu).to include({ :food => "dimsum", :price => 3 }, { :food => "soup", :price => 4 }, { :food => "rice", :price => 7 })
  end

end
