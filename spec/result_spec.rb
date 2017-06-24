require 'spec_helper'
require './lib/result'

describe ExquisiteCorpus::Result do
  it "responds to .source()" do
    result = ExquisiteCorpus::Result.new
    expect(result.source).to eq(nil)
  end

  it "responds to .content()" do
    result = ExquisiteCorpus::Result.new
    expect(result.content).to eq(nil)
  end

  it "responds to .exported_as" do
    result = ExquisiteCorpus::Result.new
    expect(result.exported_as).to eq(nil)
  end

  describe "exported_as" do
    it "will be the leading file name for sites or files"
    it "will be the domain for static sites without document name at the end of the path"
    it "jeeez-how's this work-for-feeds"
  end
end
