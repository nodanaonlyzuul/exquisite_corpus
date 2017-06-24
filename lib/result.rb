class ExquisiteCorpus::Result

  attr_reader :source, :content

  def initialize(options = {})
    @source = options[:source]
    @content = options[:content]
  end

  def exported_as
    if @source
    end
  end
end
