class ExquisiteCorpus
  attr_reader :results

  REQUIRED_ARGS = [:inputs]

  def initialize(options = {})
    check_for_required_args(options)
    @inputs  = options[:inputs]
    @results = []
  end

  def parse!
    
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
