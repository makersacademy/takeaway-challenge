require "takeaway_challenge.rb"
# require "dish.rb"

describe TakeAway do

	 it 'lets you read the menu' do
 		 t = TakeAway.new
 	  expect(t.read_menu).to eq({ "spring roll" => 0.99, "char sui bun" => 3.99, "pork dumpling" => 2.99, "peking duck" => 7.99, "fu-king fried rice" => 5.99 })
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
    expect(t.total).to eq "$19,95"
  end

end
