require './lib/creating_menu.rb'

describe Creating_menu do

  it 'menu list is created as an empty hash' do
   expect(subject.menu_hash).to be_instance_of(Hash)
  end

  it 'populates the menu hash with the menu' do
    expect(subject.hash_of_menu).not_to be_empty
  end

end
