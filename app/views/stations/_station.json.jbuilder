json.extract! station, :id, :line, :station_name, :minutes, :created_at, :updated_at
json.url station_url(station, format: :json)