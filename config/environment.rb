require 'bundler'
Bundler.require

# require the path of the root of the project
APP_ROOT = File.expand_path('..', __dir__)

# requrie the controllers
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each {|file| require file}

# require our models
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each {|file| require file}

class TaskManagerApp < Sinatra::Base
  set :root, APP_ROOT
  set :method_override, true
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end
