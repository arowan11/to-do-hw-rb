# This file is provided to help connect to your database, in production, development
# and in test.
# DO NOT CHANGE THIS FILE
ENV["RACK_ENV"] ||= "development"

require "yaml"
require "active_record"
require "pry"

if ENV["DATABASE_URL"]
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
else
  db_config = YAML.load(
    File.read(
      File.expand_path(
        File.join(__FILE__, "..", "..", "db", "database.yml")
      )
    )
  )
  ActiveRecord::Base.establish_connection(db_config[ENV["RACK_ENV"]])
end
