# Exquisite Corpus

Scrape sites, feeds, & files.
Turn them to 'just text' so you can feed them to the AI gawd.  
**You can parse any type of feed supported by [feedjira](http://feedjira.com/).**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exquisite_corpus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exquisite_corpus

## Usage


### Basic

```ruby

parser = ExquisiteCorpus.new(inputs: [
    {source: 'http://example.com'},
    {source: 'https://example.com/feed'},
    {source: '/path/to/local/file.html'}
])

parser.parse!

# A plain-text of example.com's markup
parser.results.first.content

# Want all the text?
all_content = parser.results.map(&:content)

# Export a directory of text files
parser.export_to('/a/new/directory')
```

### Don't Scrape Dumb Stuff

This library **refuses to scrape** `script`, `form`, `input`, `style` tags.
Want to exclude more?:

```ruby
parser = ExquisiteCorpus.new(inputs: [
    {source: 'http://example.com', except: ['array', 'of', 'cssSelectors']}
])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nodanaonlyzuul/exquisite_corpus.
