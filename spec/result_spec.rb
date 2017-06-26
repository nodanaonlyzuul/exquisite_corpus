require 'spec_helper'
require './lib/result'

describe Result do
  it "responds to .source()" do
    result = Result.new
    expect(result.source).to eq(nil)
  end

  it "responds to .content()" do
    result = Result.new
    expect(result.content).to eq(nil)
  end

  it "responds to .exported_as" do
    result = Result.new
    expect(result).to respond_to(:exported_as)
  end

end
