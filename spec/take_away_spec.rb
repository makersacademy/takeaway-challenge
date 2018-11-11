require 'take_away'

describe TakeAway do
  let(:kfc) { TakeAway.new("KFC", MessagingService.new) }
  let(:menu) { { large_chips: 1.99, medium_chips: 1.49, small_chips: 0.99 } }

  it 'can create a new take away' do
    expect(kfc).to be_instance_of(TakeAway)
  end

  it 'will #initialize with a name' do
    expect(kfc.take_away_name).to eq "KFC"
  end

  it 'will also #initialize with a menu' do
    expect(kfc.take_away_menu.menu).to eq menu
  end

  it 'can #provide_menu to user' do
    expect(kfc.take_away_menu.display).to eq menu
  end

  it 'can #take_order and add it to the order list' do
    kfc.take_order("medium_chips", 2)
    kfc.take_order("small_chips", 2)
    expect(kfc.order).to include({ medium_chips: 2.98, small_chips: 1.98 })
  end

  it 'can #return_order and provide the total for checking' do
    kfc.take_order("medium_chips", 2)
    kfc.take_order("small_chips", 2)
    kfc.return_order
    expect(kfc.order).to include({ medium_chips: 2.98, small_chips: 1.98, total: 4.96 })
  end

  it 'throws an error if the total is incorrect' do
    allow(kfc).to receive(:correct?) { false }
    kfc.take_order("medium_chips", 2)
    kfc.take_order("small_chips", 2)
    expect { kfc.return_order }.to raise_error("Error: Sum did not match the total")
  end

  it 'can state the #delivery_time' do
    expect(kfc.delivery_time).to be_within(3600).of(kfc.time_of_order)
  end

end
