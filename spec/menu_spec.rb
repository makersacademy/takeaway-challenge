require 'menu'

describe 'Menu' do 

  let(:menu){Menu.new}
  let(:dish){double :dish, :name=> :pizza, :price=> 30}
  
  it 'should be able to add dishes' do
    expect{menu.add_dish(dish)}.to change{
      menu.dishes.count
    }.from(0).to(1)  
  end  

  it 'should be able to display its dishes' do 
    menu.add_dish(dish) 
    expect(menu.dishes).to eq([dish]) 
  end  

end