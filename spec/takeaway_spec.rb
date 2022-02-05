require_relative '../lib/takeaway.rb'

describe Takeaway do

  let(:menu){[:chips => 3, :burger => 4, :pastie => 5]}
  
  it 'has a list of dishes' do
    expect(subject.menu).to eq menu
  end

  describe '#add_to_order' do
    let(:order){[:chips, :chips, :pastie, :pastie]}

    it 'can select items from the menu' do
      2.times {subject.add_to_order('chips')}
      2.times {subject.add_to_order('pastie')}

      expect(subject.order).to eq order
    end
  end

end