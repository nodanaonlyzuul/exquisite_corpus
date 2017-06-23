class ExquisiteCorpus
  REQUIRED_PARAMS = [:output_dir, :inputs]
  def initialize(options = {})
    REQUIRED_PARAMS.each do |required_param|
      unless options[required_param]
        throw "#{required_param} is required"
      end
    end

  end
end
