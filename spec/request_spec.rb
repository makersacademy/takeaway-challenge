require 'request'

describe Request do

  let(:channel){'sms'}
  let(:from){'from_string'}
  let(:body){'body_string'}
  let(:unequal_body){'different_body_string'}
  let(:datetime){Time.now}

  subject(:request){described_class.new(channel: channel, from: from,
                                        body: body, datetime: datetime)}

  let(:equal_request){described_class.new(channel: channel, from: from,
                                        body: body, datetime: datetime)}

  let(:unequal_request){described_class.new(channel: channel, from: from,
                                        body: unequal_body, datetime: datetime)}

  it {is_expected.to respond_to(:channel, :from, :body, :datetime)}

  it{ expect(request.channel).to eq(channel)}
  it{ expect(request.from).to eq(from)}
  it{ expect(request.body).to eq(body)}
  it{ expect(request.datetime).to eq(datetime)}

  describe '#==' do
    it {expect(request == equal_request).to be true}
    it {expect(request == unequal_request).to be false}
  end
end
