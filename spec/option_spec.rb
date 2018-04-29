require 'option'

describe Option do
  let(:dishes) { double :dishes, menu: [{ name: selection }] }
  let(:selection) { double :selection }
  subject { Option.new(dishes) }

  describe '#add_option', :add_option do
    it 'adds on 1 option to meal array' do
      subject.add_option(selection)
      expect(subject.dishes.length).to eq(1)
    end
  end 
end
