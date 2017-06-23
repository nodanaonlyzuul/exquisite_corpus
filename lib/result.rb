class ExquisiteCorpus::Result

  attr_reader :source, :content, :exported_as

  def initialize(options = {})
    @source = options[:source]
    @content = nil
    @exported_as
  end
  
end
