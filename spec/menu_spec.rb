require 'menu'

describe Menu do
  let(:dishes) { double :dishes }
  subject { Menu.new(dishes) }

  it 'creates a Menu instance' do
    expect(subject).to be_instance_of(Menu)
  end

  it 'stores a menu in an instance variable' do
    expect(subject.dishes).to eq(dishes)
  end
end
