require 'menu'

describe 'FEATURE TEST:' do
  it 'prints the menu' do
    t = Order.new
    t.menu
  end

  it 'places takeaway order' do
    t = Order.new
    t.menu
    t.add 'Love'
    t.add 'Consideration'
    t.add 'Affection', 4
    t.trolley
    t.add 'Touch', 3
    t.trolley
    # t.total
    #  => "Total: £12.93"
    # t.checkout(12.93)
  end
end
