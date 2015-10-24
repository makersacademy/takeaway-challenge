require 'takeaway'

describe Takeaway do

  it 'returns the menu' do
    expect(subject.menu).to eq subject.menu_list
  end

  describe '#initialize'
    it 'has a name, with a default' do
      expect(subject.name).to eq 'no_name'
    end

    it 'has a phone number, with a defailt' do
      expect(subject.number).to eq '+447479365828'
    end


  # it 'adds a quantity to an order'
  #   subject.order()
  #   expect(subject.order_list)
end
