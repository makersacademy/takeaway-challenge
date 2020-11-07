require 'menu'

describe Menu do

  it {is_expected.to be_an_instance_of(Menu)}

  it "Instances of menu are are instantiated with falafel_menu instance variable" do
      expect(subject).to respond_to(:falafel_menu)
    end 

  describe '#View' do
    it "Instances of the menu class respond to the view method" do
      expect(subject).to respond_to(:view)
    end
    it "Prints menu" do
      expect{subject.view}.to output("-------------------------\n      Falafel Menu       \n-------------------------\nVeggi Wrap:        £5.50\nLamb Wrap:         £6.50\nHummus:            £2.50\nFizzy Drink:       £1.50\nWater:             £1.00\n").to_stdout
    end
  end
end

