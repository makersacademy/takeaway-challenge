require 'order'

describe Order do

  it "shows menu options from Menu class" do
    expect(subject.see_options).to eq([])
  end

  it 'allows the user to select pizza' do
    expect(subject.select_pizza).to eq({:pizza=>2.99})
  end

  it 'puts selections in new order list' do
    expect(subject.select_pizza).to change{subject.new_order}
  end

end
