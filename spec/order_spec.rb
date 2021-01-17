require 'order'
require 'takeaway'

describe Order do 

  test_menu = Takeaway.new.menu
  let(:cheeseburger) { Takeaway.new.menu[10] }

  it 'should accumulated selected dishes from takeaway menu' do 
    subject.add_dish("cheeseburger")
    expect(subject.selected_dishes).to include "cheeseburger"
  end 

  it 'should add up total cost of selected dishes' do
    subject.add_dish("Cheeseburger")
    subject.add_dish("Hot dog")
    expect(subject.total).to eq 17
  end 

end 