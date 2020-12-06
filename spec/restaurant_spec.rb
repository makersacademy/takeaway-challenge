require 'restaurant'

describe Restaurant do 
  it 'can create an instance of Restaurant' do
    expect(subject).to be_kind_of(Restaurant)
  end

  it 'responds to the method .list' do
    expect(subject).to respond_to(:list_menu)
  end
end 
