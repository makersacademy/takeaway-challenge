require 'text'

describe Text do
  subject(:text){described_class.new(client, file)}
  let(:client){ double(:client, messages: messages)}

  let(:messages){double(:messages)}

  let(:file) do
    {
      account_sid: 'AC202be5a53c79055b3a05e2dace9d85f3',
      auth_token: '1ac8c5721053a2a6855843950f5dd938',
      from: "takeaway",
      to: "customer",
      body: "Thank you! Your order will be delivered before %s"

    }
  end

  it 'validates the delivery of the text' do
    args = {
      from: file[:from],
      to: file[:to],
      body: "Thank you! Your order will be delivered before 20:20"
    }
    allow(Time).to receive(:now).and_return(Time.parse('19:20'))
    expect(messages).to receive(:create).with(args)
    text.deliver_text

  end


end # => text describe
