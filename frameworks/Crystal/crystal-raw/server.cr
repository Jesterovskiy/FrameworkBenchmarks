require "http/server"
require "json"

server = HTTP::Server.new(8080) do |context|
  headers = HTTP::Headers{"Server": "Crystal", "Date": Time.utc_now.to_s}
  case context.request.path
  when "/json"
    headers.add("Content-Type", "application/json")
    HTTP::Client::Response.new 200, {message: "Hello, World!"}.to_json, headers
  when "/plaintext"
    headers.add("Content-Type", "text/plain")
    HTTP::Client::Response.new 200, "Hello, world!", headers
  else
    HTTP::Client::Response.not_found
  end
end

server.listen
