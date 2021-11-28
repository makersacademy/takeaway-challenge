require 'menu'

describe Menu do
  
  it 'should raise an error if the menu item already exists' do
    subject.generate_example_menu
    expect{subject.add_to_menu("pizza", 4)}.to raise_error 'already on menu'
  end

  it 'should let us add an item to the menu' do
    subject.add_to_menu("pizza", 4)
    expect(subject.menu_hash).to eq :pizza => 4
  end












end