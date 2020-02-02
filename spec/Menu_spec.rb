require 'menu'

describe Menu do

  it 'Menu should respond to menu' do
    expect(subject).to respond_to(:menu)
  end

  it 'Menu.menu should return an array' do
    expect(subject.menu).to be_instance_of(Array)
  end
  
end
