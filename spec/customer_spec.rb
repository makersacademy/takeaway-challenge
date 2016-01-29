require 'customer'

describe Customer do

  let(:name) {"Rufus"}
  let(:tel_no) {"1-800-EXAMPLE"}
  subject(:customer) {described_class.new(name, tel_no)}

  it{is_expected.to respond_to(:tel_no)}
  it{is_expected.to respond_to(:name)}
  it{is_expected.to respond_to(:check_bill)}

  describe '#name' do
    it 'returns customer name' do
      expect(subject.name).to eql name
    end
  end

  describe '#tel_no' do
    it 'returns customer tel_no' do
      expect(subject.tel_no).to eql tel_no
    end
  end

  describe '#check_bill' do
    # stuff
  end


end
