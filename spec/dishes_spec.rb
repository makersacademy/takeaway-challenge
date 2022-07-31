require 'dishes'
                                          
describe Dish do

  subject {described_class.new(name: "Burger", price: 1)}

  it 'has a name' do                      
    expect(subject.name).to eq("Burger")              
  end                                                   

  it 'has a price' do                                                     
    expect(subject.price).to eq(1)                                 
  end
end