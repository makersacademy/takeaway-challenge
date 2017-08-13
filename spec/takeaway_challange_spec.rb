require "takeaway_challenge.rb"

describe TakeAway do

  it 'lets you read the menu' do
 	  menu_read = described_class::MENU
 	  t = TakeAway.new
 	  expect(t.read_menu).to eq(menu_read)
  end

  it 'should take a order without count' do
  	 t = TakeAway.new
  	 expect(t.order("spring roll", nil)).to eq("1x spring roll(s) added to your basket.")
  end

  it 'should take order with count' do
  	 t = TakeAway.new
  	 expect(t.order("spring roll", 4)).to eq("4x spring roll(s) added to your basket.")
  end

  it 'displays order summary' do
  	 t = TakeAway.new
    t.order("spring roll", 4)
	   t.order("fu-king fried rice", 2)
  	 expect(t.basket_summary).to eq ["spring roll x4", "fu-king fried rice x2"]
  end

  it 'gives us the total amount we have to pay' do
    t = TakeAway.new
    t.order("spring roll", 2)
    t.order("fu-king fried rice", 3)
    t.basket_summary
    expect(t.total_amount).to eq "#{@total}"
  end

  it "gives us the time our food will arrive :D " do
  	 message = described_class::CHECKOUT_MESSAGE
    t = TakeAway.new
    t.order("spring roll", 4)
    t.basket_summary
    expect(t.checkout).to eq(message)
  end

    

end
