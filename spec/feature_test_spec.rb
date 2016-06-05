require 'menu'

describe 'FEATURE TEST:' do
  it 'prints the menu' do
    t = Order.new
    t.menu
  end

  it 'places takeaway order' do
    p t = Order.new
    #<TakeAway:0x007f975b1a39a8 @menu=#<Menu:0x007f975b1a3890 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket={}, @text_provider=#<TwilioAPI:0x007f975b1a33e0>>
    t.menu
    #  => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
    t.add 'Love'
    #  => "1x spring roll(s) added to your basket."
    t.add 'Consideration'
    #  => "1x spring roll(s) added to your basket."
    t.add 'Affection', 4
    #  => "4x spring roll(s) added to your basket."
    t.trolley
    #  => "spring roll x4 = £3.96"
    # t.add 'pork dumpling', 3
    #  => "3x pork dumpling(s) added to your basket."
    # t.trolley_status
    #  => "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
    # t.total
    #  => "Total: £12.93"
    # t.checkout(12.93)
  end
end
