require 'open-uri'
require 'feedjira'
require 'nokogiri'

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
      if input[:type] == "feed"

        feed = Feedjira::Feed.parse(response)

        feed.entries.each do |entry|
          content = Nokogiri::HTML(entry.content).css('body')

          @results << ExquisiteCorpus::Result.new(
            source:  input[:source],
            content: content.text()
          )

        end

      else
        response = Nokogiri::HTML(response).css('body')
        strip_tags!(response, input)
        # stripped_content.css("script, form, input, style").remove()

        @results << ExquisiteCorpus::Result.new(
          source:  input[:source],
          content: response.text()
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

  def strip_tags!(document, input)
    strip_except_options(document, STRIPPED_TAGS.push(input[:except]).compact.flatten)
  end

  def strip_except_options(document, css_selectors)
    
    css_selectors.each do |css_selector|
      document.search(css_selector).remove
    end
  end

end
