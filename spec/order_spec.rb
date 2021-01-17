require 'order'

describe Order do 

  test_menu = Takeaway.new.menu

  it 'should accumulated selected dishes from takeaway menu' do 
    subject.add_dish("cheeseburger")
    expect(subject.selected_dishes).to include "cheeseburger"
  end 

end 