require 'order'

describe Order do

  it 'allows the user to add meals to order' do
    expect(subject.select_meal("meal")).to eq( [{:meal => "meal", :price => 2}] )
  end

end
