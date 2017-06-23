require 'spec_helper'
require './lib/exquisite_corpus'

# TODO: Handle these errors better
describe ExquisiteCorpus do

  it "can take an optional :only or :except but not both"

  it "will have a results[] array" do
    exquisite_corpus = ExquisiteCorpus.new(inputs: [])
    expect(exquisite_corpus.results).to eq([])
  end

  it "calling parse! populates the results" do
    exquisite_corpus = ExquisiteCorpus.new(inputs: [
      {type: 'static', name: 'example.com', source: 'http://example.com'}
    ])

    exquisite_corpus.parse!
    expect(exquisite_corpus.results.length).to eq(1)
  end

  it "calling parse! when given a feed will download multiple items" do

    exquisite_corpus = ExquisiteCorpus.new(inputs: [
      {type: 'feed', name: 'example.com', source: 'https://haph2rah.wordpress.com/feed/'}
    ])

    exquisite_corpus.parse!
    expect(exquisite_corpus.results.length).to eq(10)

  end

  it "can load local html files" do
    path_to_html = File.join(__dir__, 'resources', 'cool-web-site.html')

    exquisite_corpus = ExquisiteCorpus.new(inputs: [
      {type: 'static', name: 'example.com', source: path_to_html}
    ])

    exquisite_corpus.parse!

    expect(exquisite_corpus.results.length).to eq(1)
    expect(exquisite_corpus.results.first.content.strip).to eq("Here's a cool site you may not know about.
    It lives in a gem.")
  end

  it "can only use 'static' and 'feed' as :type options of the :inputs option"

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
