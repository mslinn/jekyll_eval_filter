`jekyll_eval_filter`
[![Gem Version](https://badge.fury.io/rb/jekyll_eval_filter.svg)](https://badge.fury.io/rb/jekyll_eval_filter)
===========

`jekyll_eval_filter` evaluates given Ruby expression passed to it and returns the response.


## CAUTION
This filter can evaluation *any Ruby expression*.
No limitations are imposed.

If you use this filter, only allow trusted and verified people to edit the source of your Jekyll website.

With great power comes great responsibility.


## Usage

```
{{ '1+2' | eval }}  # returns 3

{{ 'sudo rm -rf /' | eval }}  # potentially destroys your 
# On a clear disk you can seek forever
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll_eval_filter'
```

And then execute:
```bash
$ bundle 
```


## Additional Information
More information is available on
[Mike Slinn&rsquo;s website](https://www.mslinn.com/jekyll/10400-jekyll-plugin-template-collection.html).


## Development

After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.


### Build and Install Locally
To build and install this gem onto your local machine, run:

```shell
$ bundle exec rake install
jekyll_eval_filter 1.0.0 built to pkg/jekyll_eval_filter-0.1.0.gem.
jekyll_eval_filter (1.0.0) installed.
```

Examine the newly built gem:
```
$ gem info jekyll_eval_filter

*** LOCAL GEMS ***

jekyll_eval_filter (1.0.0)
    Author: Mike Slinn
    Homepage:
    https://github.com/mslinn/jekyll_eval_filter
    License: MIT
    Installed at: /home/mslinn/.gems

    Generates Jekyll logger with colored output.
```


### Build and Push to RubyGems
To release a new version,
  1. Update the version number in `version.rb`.
  2. Commit all changes to git; if you don't the next step might fail with an unexplainable error message.
  3. Run the following:
     ```shell
     $ bundle exec rake release
     ```
     The above creates a git tag for the version, commits the created tag,
     and pushes the new `.gem` file to [RubyGems.org](https://rubygems.org).


## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
