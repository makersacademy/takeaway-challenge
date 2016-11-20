require 'dishes'
require 'menu'

describe Menu do

  let(:menu)   {Menu.new}
   let(:food1)  {double (:food1)}
   let(:food2)  {double (:food2)}
   let(:food3)  {double (:food3)}
   let(:price1) {double (:price1)}
   let(:price2) {double (:price2)}
   let(:price3) {double (:price3)}
   let(:true1)   {double (:true1)}
   let(:false1)  {double  (:false1)}
  let(:dishes) {double (:dishes)}





  context "When the method available_dishes is called" do
    it "When the method available_dishes is called should show only available dishes within an array" do
      allow(dishes).to receive(:all_dishes).and_return([{:name => food1, :price => price1, :availability => true},{:name => food2, :price => price2, :availability => false}, {:name => food3, :price => price3, :availability => true}])
      expect(menu.print_menu(dishes)).to eq(["#[Double :food1] - £#[Double :price1]","#[Double :food3] - £#[Double :price3]"])
    end
  end
  # context "when select_dishes is called" do
  #   xit "should push a dish from the menu into an array" do
  #     allow(dishes).to receive(:all_dishes).and_return([{:name => food1, :price => price1, :availability => true},{:name => food2, :price => price2, :availability => false}, {:name => food3, :price => price3, :availability => true}])
  #     expect(menu.select_dish(dishes,2)).to eq([{:name => food3, :price => price3, :availability => true}])
  #   end
  # end
  # context "when convert dishes" do
  #   xit "should convert dish to price" do
  #     allow(dishes).to receive(:all_dishes).and_return([{:name => food1, :price => price1, :availability => true},{:name => food2, :price => price2, :availability => false}, {:name => food3, :price => price3, :availability => true}])
  #     menu.select_dish(dishes,1)
  #     menu.select_dish(dishes,2)
  #     expect(menu.convert_selected_dishes_to_price).to eq [{:price => price1},{:price => price3}]
  #   end
  # end
  # context "when select quantity is called" do
  #   xit "should store the quantity within a quantity instance variable" do
  #     expect(menu.select_quantity(6)).to eq menu.quantity
  #   end
  # end



end
