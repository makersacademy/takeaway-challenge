require 'Menu'

describe Menu do

  subject(:menu) {described_class.new}
  let(:takeaway){double :takeaway, :view_menu => menu.menu_layout}

  it 'is a menu' do
  expect(described_class.new).to be_a Menu
  end

  it 'returns a menu in hash form' do
    expect(subject.menu).to be_a Hash
  end



end