require "messaging.rb"

RSpec.describe Messager do
  let(:test) { described_class.new }

  describe "#initialize" do
    it { expect(Messager).to respond_to(:new) }
    it { expect(test).to be_instance_of(Messager) }
  end

  describe "#send_message" do
    it { expect(test).to respond_to(:send_message) }
  end
end
