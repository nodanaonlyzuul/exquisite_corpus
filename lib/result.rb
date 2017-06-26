require 'uri'
require 'digest'

class Result

  attr_reader :source, :content

  def initialize(options = {})
    @source = options[:source]
    @content = options[:content]
  end

  def exported_as
    if @source

      if source_is_url?
        file_basename = output_from_url(@source)
      else
        file_basename = "#{File.basename(@source, '.*')}"
      end

      "#{file_basename}-#{rand(900000)}.txt"
    end
  end

private

  def output_from_url(source)
    uri = URI.parse(source)
    output_file = uri.host

    unless uri.path.empty?
      output_file = "#{output_file}.#{File.basename(uri.path, '.*')}"
    end

    "#{output_file}.txt"
  end

  def source_is_url?
    @uri = URI.parse(@source)
    %w( http https ).include?(@uri.scheme)
  end

end
