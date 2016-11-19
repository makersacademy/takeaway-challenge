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
    it "should show only available dishes within an array" do
      allow(dishes).to receive(:all_dishes).and_return([{:name => food1, :price => price1, :availability => true},{:name => food2, :price => price2, :availability => false}, {:name => food3, :price => price3, :availability => true}])
      expect(menu.output_dishes(dishes)).to eq(["#[Double :food1] - £#[Double :price1]","#[Double :food3] - £#[Double :price3]"])
    end
  end
  context "when select_dishes is called" do
    it "should allow the user to select any amount of dishes they like and return them" do
      expect(menu.select_dishes).to eq(["#[Double :food3] - £#[Double :price3]"])
    end
  end
end
