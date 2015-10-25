require "spec_helper"

describe "postgresql::default" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "adds an apt preference" do
    expect(chef_run).to add_apt_preference("pgdg")
  end

  it "sets up an apt repository" do
    expect(chef_run).to include_recipe("postgresql::apt_repository")
  end
end
