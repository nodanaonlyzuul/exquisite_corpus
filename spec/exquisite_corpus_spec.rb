require 'spec_helper'
require './lib/exquisite_corpus'

# TODO: Handle these errors better
describe ExquisiteCorpus do

  before do
    @resourece_dir = File.join(__dir__, 'resources')
  end

  it "will have a results[] array" do
    exquisite_corpus = ExquisiteCorpus.new(inputs: [])
    expect(exquisite_corpus.results).to eq([])
  end

  it "calling parse! populates the results" do
    VCR.use_cassette('example.com') do
      exquisite_corpus = ExquisiteCorpus.new(inputs: [
        {type: 'static', name: 'example.com', source: 'http://example.com'}
      ])

      exquisite_corpus.parse!
      expect(exquisite_corpus.results.length).to eq(1)
    end
  end

  it "calling parse! when given a feed will download multiple items" do
    VCR.use_cassette('haph2rah.wordpress.com') do
      exquisite_corpus = ExquisiteCorpus.new(inputs: [
        {type: 'feed', name: 'example.com', source: 'https://haph2rah.wordpress.com/feed/'}
      ])

      exquisite_corpus.parse!
      expect(exquisite_corpus.results.length).to eq(10)
    end
  end

  it "can load local html files" do
    path_to_html = File.join(@resourece_dir, 'cool-web-site.html')

    exquisite_corpus = ExquisiteCorpus.new(inputs: [
      {type: 'static', source: path_to_html}
    ])

    exquisite_corpus.parse!

    expect(exquisite_corpus.results.length).to eq(1)
    expect(exquisite_corpus.results.first.content.strip).to eq("Here's a cool site you may not know about.
    It lives in a gem.")
  end

  describe "The :except option" do
    it "takes an array of CSS selectors" do
      path_to_html = File.join(@resourece_dir, 'divs-and-ps.html')

      exquisite_corpus = ExquisiteCorpus.new(inputs: [
        {type: 'static', source: path_to_html, except: ['p']}
      ])

      exquisite_corpus.parse!
      expect(exquisite_corpus.results.first.content.strip).to eq('I am a top level div')
    end
  end

end
