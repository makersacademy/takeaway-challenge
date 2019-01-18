require 'menu'

RSpec.describe Menu do
  let(:menu_file) { 'menu.csv' }
  let(:new_menu) { described_class.new(menu_file) }

  it 'returns a list of dishes and prices' do
    expect(new_menu.list).to be_a(Hash)
  end

  it 'reads in menu and converts to hash' do
    expect { new_menu }.to change { subject.list }
  end

end
