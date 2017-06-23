require 'open-uri'
require 'feedjira'
require 'nokogiri'

class ExquisiteCorpus
  attr_reader :results

  REQUIRED_ARGS = [:inputs]

  def initialize(options = {})
    check_for_required_args(options)
    @inputs  = options[:inputs]
    @results = []
  end

  def parse!
    @inputs.each do |input|
      response = open(input[:source]).read
      if input[:type] == "feed"

        feed = Feedjira::Feed.parse(response)

        feed.entries.each do |entry|
          stripped_content = Nokogiri::HTML(entry.content).text()
          @results << ExquisiteCorpus::Result.new(
            source:  input[:source],
            content: stripped_content
          )
        end

      else
        stripped_content = Nokogiri::HTML(response).css('body')
        # stripped_content.css("script, form, input, style").remove()
        
        @results << ExquisiteCorpus::Result.new(
          source:  input[:source],
          content: stripped_content.text()
        )
      end
    end
  end

private

  def check_for_required_args(args)
    REQUIRED_ARGS.each do |required_arg|
      unless args[required_arg]
        throw "#{required_arg} is required"
      end
    end
  end

end
