require 'takeaway'

RSpec.describe Takeaway do

  let(:mock_menu_type) { double :mock_menu_type, new: mock_menu }
  let(:mock_menu)      { double :mock_menu, display_menu: "Menu items and prices" }
  subject { described_class.new(menu_type: mock_menu_type) }

  it "should display a list of dishes with prices" do
    expect(subject.display_menu).to eq "Menu items and prices"
  end

end
