describe Bosh::Cloudfoundry::ReleaseVersion do
  it "cannot accept versions lower than 132" do
    expect { Bosh::Cloudfoundry::ReleaseVersion.for_version(131) }.to raise_error(RuntimeError)
  end

  it "finds an exact version match" do
    Bosh::Cloudfoundry::ReleaseVersion.for_version(132).version_number.should == 132
  end

  it "finds an next available version match" do
    Bosh::Cloudfoundry::ReleaseVersion.for_version(133).version_number.should == 132
  end

  it "knows available versions" do
    Bosh::Cloudfoundry::ReleaseVersion.available_versions.should == [132]
  end

  it "loads available CPIs" do
    Bosh::Cloudfoundry::ReleaseVersion.for_version(132).available_cpi_names.should == %w[aws openstack]
  end
end