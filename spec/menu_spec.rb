require 'menu'

describe Menu do
  it 'can create an instance of menu' do
    expect(subject).to be_kind_of(Menu)
  end

  it 'can respond to see_menu' do
    expect(subject).to respond_to(:see_menu)
  end

  it 'will display the menu to the customer' do
    expect { subject.see_menu }.to output("1 Chip: £90\nEels: £50\nOctopus: £120\nPea: £200\nDeep Fried Banana: £250\n").to_stdout
  end
end
