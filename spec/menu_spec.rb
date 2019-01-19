require 'menu'

RSpec.describe Menu do

  it "Should display the menu" do
  expect(subject.display_menu).to eq subject.menu
  end
end
