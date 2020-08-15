require "customer"

describe Customer do 

  describe "#place_order" do 
    it { expect(subject).to respond_to(:place_order) }
    it "Returns and array with the customers order" do
      expect(subject.place_order("pasta").is_a?(Array)).to be true 
    end
  end


end
