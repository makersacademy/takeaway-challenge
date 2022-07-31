require 'dish'

describe Dish do
  subject { described_class.new("Swedish Meatballs", 2.50) }
  
  it 'has a name and a price' do 
    expect(subject).to have_attributes(:name => "Swedish Meatballs", :price => 2.50)
  end
end
