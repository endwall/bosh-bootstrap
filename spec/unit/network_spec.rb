describe Bosh::Bootstrap::Network do
  include Bosh::Bootstrap::Cli::Helpers::Settings

  let(:aws_provider_client) { stub() }
  let(:vsphere_provider_client) { stub() }

  it "uses NetworkProvider if available" do
    network = Bosh::Bootstrap::Network.new("aws", aws_provider_client)
    aws_provider_client.stub(:create_security_group)
    network.deploy
  end

  it "does nothing if no NetworkProvider for the infrastructure" do
    network = Bosh::Bootstrap::Network.new("vsphere", vsphere_provider_client)
    network.deploy
  end
end