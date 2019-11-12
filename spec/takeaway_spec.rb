require 'takeaway'
takeaway = Takeaway.new
describe takeaway do
  it {expect(subject).to be_instance_of(Takeaway)}

  describe '#menu' do
    it{is_expected.to respond_to(:menu)}
end
it 'expect to select dishes' do
  is_expected(subject.print_menu).to eq_to(:menu)

end
end
#end
