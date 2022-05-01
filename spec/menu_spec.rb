require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  it 'creates new instances of Menu class' do
    expect(subject).to be_an_instance_of(Menu)
  end

end