require 'menu'

describe Menu do

  it "has a menu which can be read by the user" do
    expect(subject).to be_kind_of(Menu)
  end

  it "is the place the menu is stored" do
    expect(subject.menu).to include({ 'dimsum' => 3, 'soup' => 4, 'rice' => 7 })
  end

end
