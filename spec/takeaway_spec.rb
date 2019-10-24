require 'takeaway'
require 'dish'

describe Takeaway do
  subject { described_class.new(Menu.new) }

  it 'checks that menu is a list of dishes' do
    expect(subject.show_menu).to all(be_an(Dish))
  end
  # it '' do
  # end
end
