require 'takeaway'

describe Takeaway do

  let(:dish1) { double :dish, :name => 'milk', :price => 2 }
  let(:dish2) { double :dish, :name => 'chips', :price => 3 }
  let(:menu) { double :menu, :dishes => [dish1, dish2], :find_dish => dish2 }
  let(:menu_class) { double :menu_class, :new => menu }
  let(:subject) { Takeaway.new(menu_class) }

  it 'read_menu returns a menu object' do
    expect(subject.read_menu). to eq({ 'milk' => 2, 'chips' => 3 })
  end

  it 'select_dish adds the chosen dish to the current order' do
    subject.select_dish('chips')
    expect(subject.current_order.dishes).to include dish2
  end

end
