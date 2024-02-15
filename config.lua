-- This is intentionally a lua file
-- and also intentionally placed in the root directory.

local config = require("lapis.config")

config("development", {
  server = "nginx",
  port = 8080,
  ssl_port = 443,
  code_cache = "off",
  num_workers = "1",
  session_name = "dhp_session",
  secret = "this is my secret string 123456",
  measure_performance = true,
  worker_connections = 1024,
  daemon = "off",
  postgres = {
    host = "127.0.0.1",
    user = "postgres",
    password = "postgres",
    database = "delta_homepage"
  }
})

config("production", {
  track_exceptions = true,
  server = "nginx",
  port = 80,
  ssl_port = 443,
  code_cache = "on",
  num_workers = "4",
  session_name = "dhp_session",
  secret = os.getenv('SESSION_SECRET'),
  measure_performance = true,
  worker_connections = 1024,
  daemon = "off",
  postgres = {
    host = os.getenv('POSTGRES_HOST'),
    user = os.getenv('POSTGRES_USER'),
    password = os.getenv('POSTGRES_PASS'),
    database = os.getenv('POSTGRES_DB'),
  }
})
