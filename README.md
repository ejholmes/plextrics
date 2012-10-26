# Plextrics

A sinatra app for converting heroku log streams into stathat metrics. Inpsired
by [l2met](https://github.com/ryandotsmith/l2met).

## Installation

Add this line to your application's Gemfile:

    gem 'plextrics'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plextrics

## Usage

```bash
$ git clone git@github.com:ejholmes/plextrics.git
$ heroku create
$ git push heroku master
$ heroku drains:add https://your-plextrics.herokuapp.com/stathat?ezkey=<your ezkey> -a someapp
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
