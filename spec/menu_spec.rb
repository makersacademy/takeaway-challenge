 require 'menu.rb'

 describe Menu do

   # let (:food) {double :eggs}
   it "can select particular dishes that exist on the menu" do
     expect(subject.select_food(:ratatouille)).to eq :ratatouille
   end

   it "raises an error message if the dish doesn't exist" do
     expect(subject.select_food(:old_eggs)).to eq "we don't serve that, please select something from the menu"
   end

   it "can add selected dishes to a new order" do
    subject.select_food(:eggs)
    subject.select_food(:ratatouille)
    expected = {:eggs => 5, :ratatouille => 20}
    subject.order.should == expected
   end

  describe '#price' do
     it "adds up the costs of the selected food" do
       subject.select_food(:eggs)
       subject.select_food(:ratatouille)
      expect(subject.price).to eq 25
    end
  end

 end
