# Gems
require "logger"
require "openssl"
require "require_all"
require "sequel"
require "sinatra"

# So we can escape HTML special characters in teh view
include ERB::Util

# Sessions
enable :sessions

# Database
mode = ENV.fetch("APP_ENV", "development")
path = File.dirname(__FILE__)
file_minus_ext = "#{path}/#{mode}"

DB = Sequel.sqlite("#{file_minus_ext}.sqlite3", logger:
                              Logger.new("#{file_minus_ext}.log"))


# Require 
require_rel "models", "controllers"


