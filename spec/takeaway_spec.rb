require "takeaway"

describe Takeaway do
let(:restaurant_name) { ("Health food Haven") }

   it{  is_expected.to respond_to :restaurant_list}

   describe '#restaurant_choice' do
     it "collects the user input for the restaurant" do
       expect(subject.restaurant_choice(restaurant_name)).to eq restaurant_name
     end
     it "rejects restaurants that are not yet serviced" do
       expect{subject.restaurant_choice("McDonalds")}.to raise_error "Sorry we don't serve McDonalds yet"
     end
   end

end
