require 'takeaway'

describe TakeAway do
  let(:menu){ double(:menu) }
  it "can add a menu" do
    expect(subject.add_menu(menu)).to eq(menu)
  end

  it "can show the menu" do
    expect(subject.show_menu).to eq(subject.menu)
  end


end