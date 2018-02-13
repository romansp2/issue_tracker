module SendPost
  def post(data)
    json_headers = {"Content-Type" => "application/json",
                    "Accept" => "application/json"}

    uri = URI.parse('http://127.0.0.1:3000/issues/') #делать HTTP POST-запрос на указанный адрес
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.post(uri.path, data.to_json, json_headers)

  end
end