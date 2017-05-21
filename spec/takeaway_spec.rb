require 'takeaway'

describe Takeaway do

  let(:menu) { double :menue }
  let(:menu_class) { double :menu_class, :new => menu }
  let(:subject) { Takeaway.new(menu_class) }

  it 'read menu returns a menu object' do
    expect(subject.read_menu). to eq menu
  end

end
