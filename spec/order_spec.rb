require 'order'

describe Order do
  
  it 'should contain an empty order by default' do
    expect(subject.basket).to eq []
  end

  it 'should contain a menu' do
    expect(Order::MENU).to eq(subject.view_menu)
  end

end