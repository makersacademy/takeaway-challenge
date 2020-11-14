require 'takeaway'
takeaway = Takeaway.new
describe takeaway do
  it {expect(subject).to be_instance_of(Takeaway)}

#  let(:menu) { double(:menu, print: print_menu) }

  describe '#menu' do
    it{is_expected.to respond_to(:menu)}
end
it 'can to place order several dishes'do
expect(subject).to respond_to(:place_order)
end

#it 'expect to print menu' do
#  is_expected(subject.print_menu).to eq_to(:menu)

end

#end
#end
