require 'takeaway_menu'

describe TakeAwayMenu do

  let(:subject) {described_class.new}

  it 'contains a readable menu' do
      expect(subject.read["spring roll"]).to eq 0.99
  end

end
