require 'printed_menu'

describe Printed_menu do

  it "has a list of items and prices" do
    expect(subject.print_printed_menu).to eq Printed_menu::PRINTED_MENU
  end

end
