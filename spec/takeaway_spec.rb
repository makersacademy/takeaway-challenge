require 'takeaway'

describe Takeaway do
  subject { Takeaway.new }

  it 'check if a new takeaway project is an istance of Takeaway class' do
   expect(subject).to be_an_instance_of Takeaway
  end
  context '#menu' do
    it 'check if subject respond to a method menu' do
      expect(subject).to respond_to(:list_menu)
    end

    # it 'check if a list of dishes with prices' do
    #   expect(subject.list_menu).to eq(rice: 2.00)
    # end

    it 'subject needs back an hash' do
      menu = {rice: 2,
      beef: 3,
      pizza: 3.5,
      beer: 2}
      expect(subject.list_menu).to eq(menu)
    end



  end #context #menu





end #Describe
