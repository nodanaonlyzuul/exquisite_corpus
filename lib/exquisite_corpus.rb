require 'rubygems'
require 'open-uri'
require 'feedjira'
require 'nokogiri'
require 'fileutils'

require File.join(__dir__, 'result')

class ExquisiteCorpus
  attr_reader :results

  REQUIRED_ARGS = [:inputs]
  STRIPPED_TAGS = %w{script form input style}

  def initialize(options = {})
    check_for_required_args(options)
    @inputs  = options[:inputs]
    @results = []
  end

  def parse!
    @inputs.each do |input|
      response = open(input[:source]).read
      parse_feed(input, response) || parse_html(input, response)
    end
  end

  def export_to(path)
    unless @results.empty?
      path = File.expand_path(path)
      FileUtils.mkdir_p(path)
      @results.each do |result|
        File.write(File.join(path, result.exported_as), result.content)
      end
    end
  end

private

  def parse_feed(input, response)
    begin
      feed = Feedjira::Feed.parse(response)

      feed.entries.each do |entry|
        content = Nokogiri::HTML(entry.content).css('body')
        @results << Result.new(
          source:  input[:source],
          content: content.text()
        )
      end
    rescue
      false
    end
  end

  def parse_html(input, response)
    begin
      response = Nokogiri::HTML(response).css('body')
      strip_tags!(response, input)

      @results << Result.new(
        source:  input[:source],
        content: response.text()
      )
    rescue Exception => e
      require 'pry'; binding.pry
      false
    end
  end

  def check_for_required_args(args)
    REQUIRED_ARGS.each do |required_arg|
      unless args[required_arg]
        throw "#{required_arg} is required"
      end
    end
  end

  def strip_tags!(document, input)
    strip_except_options(document, STRIPPED_TAGS.push(input[:except]).compact.flatten)
  end

  def strip_except_options(document, css_selectors)
    css_selectors.each do |css_selector|
      document.search(css_selector).remove
    end
  end

end
