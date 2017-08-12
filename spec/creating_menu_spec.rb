require './lib/creating_menu.rb'

describe Creating_menu do
  let(:csv) { double :csv }
  let(:menu_file) { double :menu_file }
  let(:create_menu) { described_class.new }

  it 'menu list is created as an empty hash' do
    expect(subject.menu_hash).to be_instance_of(Hash)
  end

  it 'populates the menu hash with the menu' do
    expect(subject.hash_of_menu).not_to be_empty
  end

  it 'puts this hash into a file' do
    create_menu.putting_hash_into_file
    allow(menu_file).to receive(:open)
    #how to test something iterates through a hash
    allow(menu_file).to receive(:puts)
  end

end
