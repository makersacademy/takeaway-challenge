require 'takeaway'

describe Takeaway do
  subject { described_class.new }
  menu = Menu.new

  it 'displays a menu to the customer' do
    expect(subject.show_menu).to eq menu.dishes
  end
end
