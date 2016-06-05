require 'menu'

describe 'FEATURE TEST:' do
  it 'prints the menu' do
    t = Order.new
    t.menu
  end

  it 'places takeaway order and checks out' do
    t = Order.new
    t.menu
    t.add 'Love'
    t.add 'Consideration'
    t.add 'Affection', 4
    t.trolley
    t.add 'Touch', 3
    t.trolley
    t.total
    # t.checkout(28.50)
  end
end
