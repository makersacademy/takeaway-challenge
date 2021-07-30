require 'order'

describe Order do

  let(:order1) {Order.new(menu: menu1)}
  let(:menu1) {double("menu")}
  

  it "selects several dishes" do

    order1.add(:chicken, 2)
    order1.add(:lamb, 1)
    order1.add(:camel, 3)
    
    expect(order1.ordered_dishes).to eq ({chicken: 2, lamb: 1, camel: 3})
  end

  it "doesn't allow dishes that aren't on the menu" do #needs knowledge of the menu, need to inject inside order a menu object
    expect(order1.add(:pork, 4)). to raise_error "pork is not on the menu"
  
  end
end