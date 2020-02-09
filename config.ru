require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController

  use Rack::MethodOverride
  use SongsController

  use Rack::MethodOverride
  use ArtistsController

  use Rack::MethodOverride
  use GenresController

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
