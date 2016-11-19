require 'menu'

describe Menu do

  it 'has a list of dishes' do
    expect(subject.menu_list).to eq([])
  end

  it 'saves dishes with prices' do
    expect(subject.add_meal("meal", 2)).to eq( [{:meal => "meal", :price => 2}] )
  end

  it 'adds new meals to the menu' do
    expect{subject.add_meal("meal", 2.0)}.to change{subject.menu_list}
  end

  # it 'allows the user to choose meals to order' do
  #   expect(subject.select_meal("meal")).to eq( [{:meal => "meal", :price => 2}] )
  # end

end
