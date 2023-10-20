# gem install puma
# gem install rackup
# rackup config.ru

require 'rack'
require 'puma'
require 'rack/handler/puma'

app = -> (env) do
  [200, { 'Content-Type' => 'text/html' }, ["<h1>#{Time.now}</h1>\n"]]
end

Rack::Handler::Puma.run(app, Port: 3000)
