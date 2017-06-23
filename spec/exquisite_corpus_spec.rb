require 'spec_helper'
require './lib/exquisite_corpus'

# TODO: Handle these errors better
describe ExquisiteCorpus do

  it "can take an optional :only or :except but not both"
  it "will have a results[] array"
  # TODO: make an Export class and test the heck out of it.
  it "responds to export_to!"

  it "will throw an exception without an :output_dir" do
    expect(Proc.new {ExquisiteCorpus.new(inputs: [])}).to raise_error()
  end

  it "will throw an exception without :inputs" do
    expect(Proc.new {ExquisiteCorpus.new(output_dir: "foo")}).to raise_error()
  end

  describe "parsing a feed" do
    it "requires a URL"
  end

  describe "parsing a non-feed HTML page" do
    it "requires a URL"
    it "requires an output_file_name"
  end

  describe "The :except option" do
    it "works"
  end

  describe "The :only option" do
    it "works"
  end
end
