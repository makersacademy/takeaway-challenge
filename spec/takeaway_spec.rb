require 'takeaway'

describe Takeaway do
  
  context 'being able to create a takeaway class' do

    it "exists" do
      expect(subject).to eq subject
    end

    it "displays a list of the dishes with price" do
      expect(subject.menu).to eq({ "pelmeni" => 6.99, "borscht" => 4.99, 
      "salat" => 5.99, "olivier" => 9.99, "tvarog" => 2.99, "smetyana" => 1.99 })
    end
  end
  
end
