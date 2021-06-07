require 'menu'

RSpec.describe Menu do

  it 'can view the menu' do 
    expect(subject.view).to include('----------------------->') 
  end

  it 'can select an item' do
    expect(subject.select("pizza").length).to eq(2)
  end
end
