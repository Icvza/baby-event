require './config/environment'

use Rack::MethodOverride
run ApplicationController
use BabiesController
use EventsController
use UsersController
