require 'spec_helper'
require './lib/exquisite_corpus'

# TODO: Handle these errors better
describe ExquisiteCorpus do

  it "can take an optional :only or :except but not both"

  it "will have a results[] array" do
    exquisite_corpus = ExquisiteCorpus.new(inputs: [])
    expect(exquisite_corpus.results).to eq([])
  end

  it "responds to parse!" do
    exquisite_corpus = ExquisiteCorpus.new(inputs: [])
    expect(exquisite_corpus).to respond_to(:parse!)
  end

  it "calling parse! populates the results" do
    exquisite_corpus = ExquisiteCorpus.new(inputs: [
      {type: '', name: 'example.com', source: 'http://example.com'}
    ])
  end

  it "responds to export_to"

  it "will throw an exception without :inputs" do
    expect(Proc.new {ExquisiteCorpus.new(output_dir: "foo")}).to raise_error()
  end

  describe "parsing a feed" do
    it "requires a URL"
  end

  describe "parsing a non-feed HTML page" do
    it "requires a location"
    it "requires an output_file_name"
  end

  describe "The :except option" do
    it "works"
  end

  describe "The :only option" do
    it "works"
  end
end
