require 'takeaway'

describe Takeaway do
  takeaway = Takeaway.new

  it 'shows a list of dishes with prices when you view the menu' do
    expect(takeaway.view_menu).to eq([{ :dish => "margarita", :price => 7.5 }, { :dish => "hawaian", :price => 8.50 }, { :dish => "garlic bread", :price => 5 }])
  end

  it 'customer can choose an available dish' do
    expect(takeaway.select_dish("margarita", 2)).to eq("2 x margarita added to your basket. That will be £15.\nAnything else?")
  end

end
