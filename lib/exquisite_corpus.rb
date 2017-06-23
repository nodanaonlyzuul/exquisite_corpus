require 'httparty'
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
      if input[:type] == "feed"
      else
        body = HTTParty.get(input[:source]).body
        stripped_content = Nokogiri::HTML(body).css('body')
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
