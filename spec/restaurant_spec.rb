require 'restaurant'

describe Restaurant do

  describe "#initialize" do

    it 'should create an empty list' do
      expect(subject.list).to be_empty
    end

    it 'should set the sum to 0' do
      expect(subject.sum).to eq 0
    end

    it 'should create an empty phone number' do
      expect(subject.phone_number).to be_empty
    end

  end

end
