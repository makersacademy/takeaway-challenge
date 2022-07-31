describe SendText do
  it { is_expected.to respond_to(:go_send) }

  it { is_expected.to respond_to(:message) }
end