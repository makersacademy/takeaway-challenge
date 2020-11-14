require 'takeaway'

describe Takeaway do
  subject { described_class.new(Menu.new) }

  it 'checks that menu is a list of dishes' do
    instance_double('dish', name: "Swedish Meatballs", price: 2.50)
    expect(subject.show_menu).to all(be_an(Dish))
  end
  # it '' do
  # end
end
