require 'menu'

describe Menu do

  # it 'starts with empty menu' do
  #   expect(subject.menu_list).to eq([])
  # end
  #
  # it 'can create new meals with prices' do
  #   expect(subject.add_meal("meal", 2)).to eq( [{:meal => "meal", :price => 2}] )
  # end
  #
  # it 'adds new meals to the menu' do
  #   expect{subject.add_meal("meal", 2.0)}.to change{subject.menu_list}
  # end

  it 'has a populated menu' do
    expect(subject.menu_list).to eq({:pizza => 2.99, :thai => 4.55, :mexican => 5.25})
  end

end
