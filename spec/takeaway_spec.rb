require 'Takeaway'

RSpec.describe Takeaway do 

  describe '#see_list_of_dishes' do 
    it "should show me the list of dishes available" do
      expect(subject.food).to eq ({
        "pasta" => 3.50,
        "lasagna" => 5.00,
        "water" => 1.50,
    })
    end
    it 'should show the value of pasta at 3.50' do
      expect(subject.food['pasta']).to eq (3.50)
    end
    it 'should include water' do 
      expect(subject.food).to include({'water' => 1.50})
    end
  end
end

