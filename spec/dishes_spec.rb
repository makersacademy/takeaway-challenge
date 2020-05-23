require 'dishes'

describe Dishes do
  subject { described_class.new }
  let(:menu) { [{ toast: 3, cereal: 2, coffee: 2 }] }

  context "#view(dishes)" do
    it "should respond to #view with one argument" do
      expect(subject).to respond_to(:view).with(1).argument
    end
    
    it "should return a hash of dishes and prices" do
      subject.view(menu)
      expect(subject.menu).to eq menu 
    end

    it "should match the menu array " do
      subject.view(menu)
      expect(subject.menu).to match_array menu
    end
  end 
end
