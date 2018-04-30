require 'confirm'

describe Confirm do

  let(:client) { spy :client_dobule, create: "Thank you!" }

  it ' should sent a message confirming order' do
    subject.instance_variable_set(:@client, client)
    expect(subject.send_text).to eq("Thank you!")
  end

end
