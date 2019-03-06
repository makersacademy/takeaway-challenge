require 'menu'

RSpec.describe Menu do

  it "Should display the menu" do
  expect(subject.display_menu).to eq subject.menu
  end

  context 'list given when menu is created' do
  subject(:menu) { described_class.new(@menu) }
  before(:each) do
    @menu = {:pizza => 2, :burger => 2}
  end

  it 'should display the  menu' do
    expect(subject.display).to eq @menu
  end

  it 'should know if a dish is on the menu' do
    expect(subject.contains_dish?("pizza")).to eq true
  end
end
end
