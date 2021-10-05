require 'dish'



describe "#Dish" do 
subject(:dish) {described_class.new(item, price)}
   it 'should create a new dish with the item and price' do
   item =  Dish.new("Margherita", 8.99)
   expect(item.price). to eq(8.99)
  end
end