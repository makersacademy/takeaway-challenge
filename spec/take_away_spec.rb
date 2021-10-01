require_relative "../lib/take_away.rb"

describe Takeaway do 
  before(:each) do
    take_away = Takeaway.new
  end
  it 'returns the contents of the menu; item and price' do
    expect(subject.list_menu).to eq({:burger=>5.0, :chips=>2.0, :coke=>1.0})
  end
  
end