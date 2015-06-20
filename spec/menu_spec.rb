require 'menu'

describe Menu do
  let(:menu) {Menu.new}

  it {is_expected.to respond_to :view}

  it "should display the menu when view is called" do
    expect(menu.view).to eq "{:\"Chop Suey\"=>7.0, :\"Dim Sum\"=>6.5, :\"Prawn Crackers\"=>2.0, :\"Duck Chow Mein\"=>7.5, :\"Spare ribs\"=>9.0, :\"Fortune Cookies\"=>3.0}"
  end

end
