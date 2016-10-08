require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'responds to see menu' do
    expect(menu).to respond_to(:see_menu)
  end

  it 'prints the menu' do
    expect(STDOUT).to receive(:puts).exactly(11).times
    subject.see_menu
  end
end
