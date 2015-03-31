require 'restaurant'

describe Restaurant do
  let(:restaurant){ Restaurant.new}

  it "can list dishes and their prices" do
		expect(restaurant.respond_to?(:menu)).to be true
	end

  it 'should have a default list of dishes' do
    expect(restaurant.menu.keys).to eq [:sandwich, :pasta]
  end

  it 'should have prices for each dish' do
    expect(restaurant.menu[:sandwich]).to eq 5
    expect(restaurant.menu[:pasta]).to eq 6
  end

  it 'should be able to check if an order is incorrect' do
    expect{restaurant.check_order([:sandwich, :pasta], 12)}.to raise_error "Incorrect total sum"
  end

  it 'should be able to check if an order is correct' do
    restaurant.stub(:send_sms)
    expect(restaurant.check_order([:sandwich, :pasta], 11)). to eq true
  end
end
