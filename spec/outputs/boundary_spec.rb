# encoding: utf-8
require "logstash/devutils/rspec/spec_helper"
require 'logstash/outputs/boundary'

describe LogStash::Outputs::Boundary do

  let(:plugin) { described_class.new(config) }

  describe "debugging `api_key`" do
    let(:config) {{ "org_id" => "my-org-id", "api_key" => "$ecre&-key" }}

    it "should not show origin value" do
      expect(plugin.logger).to receive(:debug).with('<password>')

      plugin.register
      plugin.logger.send(:debug, plugin.api_key.to_s)
    end
  end

end
