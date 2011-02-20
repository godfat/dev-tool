# README

Clone this into ~/ and source .config/dev-tool/bash_profile, or, for lazies:

# How to install?

    curl https://github.com/godfat/dev-tool/raw/master/bin/dev-tool > /tmp/dev-tool
    ruby /tmp/dev-tool install

# How to update?

    dev-tool update

# Environment Variable Options:

1. set `PROMPT_PATH_ABBR` to enable path abbreviation

# Recommended Gems:

|--- interactive shell
| `gem install ripl`              | flexible irb
| `gem install ripl-multi_line`   | multiline input
| `gem install pry`               | interactive breakpoint
| `gem install awesome_print`     | more pretty_print
|--- gem environment sandbox
| `gem install bundler`           | pretty useful for development
|--- testing
| `gem install rr`                | stubs, mocks, proxy, spies for testing
| `gem install bacon`             | lightweight unit test with rspec flavor
| `gem install webmock`           | stubs on net/http
|--- markdown
| `gem install kramdown`          | superset of markdown
|--- serialization
| `gem install msgpack`           | binary protocol
|--- http client
| `gem install rest-client`       | better interface for net/http
| `gem install em-http-request`   | http client on eventmachine
| `gem install em-synchrony`      | not http, doing synchrony on eventmachine
|--- xml/html parser
| `gem install nokogiri`          | backend is libxml2
|--- json parser
| `gem install yajl-ruby`         | better than json and json_pure
|--- web servers
| `gem install zbatery`           | which uses rainbows which uses unicorn
| `gem install thin`              | simple standalone web server
|--- ORM and database client
| `gem install dm-core`           | modular ORM
| `gem install dm-aggregates`     | to use count
| `gem install dm-migrations`     | to use auto_migrate!
| `gem install dm-timestamps`     | to use activerecord's created_at, etc.
| `gem install dm-types`          | various datatype e.g. URI, JSON, Enum, etc
| `gem install dm-sqlite-adapter` | sqlite adapter
