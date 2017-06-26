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
    expect(result).to respond_to(:exported_as)
  end

end
