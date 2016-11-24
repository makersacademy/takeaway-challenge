require 'menu'

describe 'Menu' do 

  let(:menu){Menu.instance}
  let(:dish){double :dish, :name=> :pizza, :price=> 30}
  
  it 'should be able to add dishes' do
    expect{menu.add_dish(dish)}.to change{
      menu.dishes.count
    }.from(0).to(1)  
  end  

  it 'should be a singleton class' do 
    expect(menu).to be_a(Singleton) 
  end

  it 'should be able to display dishes' do 
    expect(menu.dishes).to be_a(Array)
  end  

end