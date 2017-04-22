require 'dishes'
require 'menu'

describe Menu do


   let(:food1)  {double (:food1)}
   let(:food2)  {double (:food2)}
   let(:food3)  {double (:food3)}
   let(:price1) {double (:price1)}
   let(:price2) {double (:price2)}
   let(:price3) {double (:price3)}
   let(:true1)   {double (:true1)}
   let(:false1)  {double  (:false1)}
  let(:dishes) {double (:dishes)}
  let(:menu)   {Menu.new(dishes)}





  context "When the method available_dishes is called" do
    it "If the dish passed to available dishes is not on the menu" do
      allow(dishes).to receive(:list).and_return([{food1 => 5},
        {food2 => 3}])
      expect(menu.available_dishes(food3)).to eq false
    end

    it "If the dish passed to available dish is on the menu" do
      allow(dishes).to receive(:list).and_return([{food1 => 5},
        {food2 => 3}])
        expect(menu.available_dishes(food1)).to eq true
    end
  end






end
