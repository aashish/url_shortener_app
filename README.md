# Url Shortener

<img src="https://travis-ci.org/aashish/url_shortener_app.svg?branch=master" alt="Build Status" />

Url Shortener is a Web application using Ruby on Rails 5.x. This application will shorten the provided url. This app also provides stats of users who used the shortened url such as location, browser, etc

## Usage

Run the application by

```
$ cd project_folder
$ rake db:migrate
$ rails s
```

## Stats API
API endpoint is being where you can query stats around a particular shortened URL

```
$ curl http://localhost:3000/links/f9aeec9ec1/stats
[{"id":10,"given_url":"https://stackoverflow.com/questions/1357118/event-preventdefault-vs-return-false","slug":"f9aeec9ec1","clicks":13,"created_at":"2018-04-28T20:21:50.507Z","updated_at":"2018-04-28T21:00:52.135Z","statistics":[{"id":1,"link_id":10,"ip":"127.0.0.1","latitude":null,"longitude":null,"requested_at":"2018-04-28T20:59:17.635Z","request_from":"Firefox","created_at":"2018-04-28T20:59:17.661Z","updated_at":"2018-04-28T20:59:17.661Z"},{"id":2,"link_id":10,"ip":"127.0.0.1","latitude":null,"longitude":null,"requested_at":"2018-04-28T20:59:33.340Z","request_from":"Firefox","created_at":"2018-04-28T20:59:33.350Z","updated_at":"2018-04-28T20:59:33.350Z"},{"id":3,"link_id":10,"ip":"127.0.0.1","latitude":"17.412271099999998","longitude":"17.412271099999998","requested_at":"2018-04-28T21:00:52.129Z","request_from":"Firefox","created_at":"2018-04-28T21:00:52.138Z","updated_at":"2018-04-28T21:00:52.138Z"}]}]

```

## Tests

This project is using `Rspec` implementation for tests.



Live demo application is at https://url-shortener-plus.herokuapp.com/

## Todo

- Add Tags to urls.
- Add user authentication.
- Integrate maps.
- Integrate with Social media applications.

## Contributing

1. Fork it ( https://github.com/aashish/url_shortener_app/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
