require 'menu'

RSpec.describe Menu do
  let(:menu) { 'menu.csv' }

  it 'returns a list of dishes and prices' do
    expect(subject.list).to be_a(Hash)
  end

  it 'reads in menu and converts to hash' do
    expect { subject.read_menu(menu) }.to change { subject.list }
  end

end
