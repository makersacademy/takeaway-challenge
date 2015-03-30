require 'printer'

describe Printer do
  xit 'prints to the screen the menu with dishes and prices' do
    menu.stub(:menu).and_return("CTM" => 6.7, "CVBS" => 18.4)
    expect(described_class.show(menu.dishes)).to eq "\"CTM\" — 6.7\n\"CVBS\" — 18.4"
  end
end