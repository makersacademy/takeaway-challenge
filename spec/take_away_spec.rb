require 'take_away' 
describe TakeAway do 
  let(:pasta) {double :meal, name: "pasta", price: 6}
  let (:order) {double :order, meals: pasta}
  let (:kenmenu) {double :menu}
  let (:somenu){double :menu}
  let (:mohas){TakeAway.new [somenu]}
  it 'has a menu when it is initialized' do 
    expect(mohas.menu).to eq [somenu]
  end
  it 'can add more menus' do 
    expect(mohas.menu).to eq [somenu]
    mohas.add_menu kenmenu
    expect(mohas.menu).to eq [somenu,kenmenu]
  end
  it 'can place orders' do 
    expect(mohas.place_order order).to eq pasta
  end
  it 'can check if has any orders' do 
    expect(mohas.place_order order).to eq pasta
    expect(mohas).to have_order
  end

end
