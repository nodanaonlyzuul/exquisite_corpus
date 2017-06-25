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

  # describe "exported_as" do
  #
  #   it "will different depending on the input" do
  #     result = ExquisiteCorpus::Result.new(source: File.join(__dir__, 'foo.html'))
  #     expect(result.exported_as).to eq('foo.txt')
  #
  #     result = ExquisiteCorpus::Result.new(source: "http://foo.example.com/page.html")
  #     expect(result.exported_as).to eq('foo.example.com.page.txt')
  #
  #     result = ExquisiteCorpus::Result.new(source: "http://foo.example.com")
  #     expect(result.exported_as).to eq('foo.example.com.txt')
  #   end
  #
  #   it "jeeez-how's this work-for-feeds" do
  #     VCR.use_cassette('haph2rah.wordpress.com') do
  #       exquisite_corpus = ExquisiteCorpus.new(inputs: [
  #         {type: 'feed', name: 'example.com', source: 'https://haph2rah.wordpress.com/feed/'}
  #       ])
  #
  #       exquisite_corpus.parse!
  #     end
  #   end
  # end
end
