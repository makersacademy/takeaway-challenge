require 'menu'

describe Menu do 

  it 'checks that a class exists' do
    expect(subject).to be_a Menu
  end

  describe 'initialize' do
    it 'prints available dishes' do
      expect(subject.items).to eq({ "margarita" => 5, "garlic bread" => 3 })
    end
  end 
end 
