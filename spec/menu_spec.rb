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
    it "should show only available dishes" do
      allow(dishes).to receive(:all_dishes).and_return([{:name => food1, :price => price1, :availability => true},{:name => food2, :price => price2, :availability => false}])
      expect(menu.available_dishes(dishes)).to eq(["#[Double :food1] - £#[Double :price1]"])
    end
  end
end
