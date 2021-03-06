load "deploy/assets"

set :application, "BodyKit.Me"
set :deploy_to, "/var/www/bkm/"
set :rails_env, "production"
set :normalize_asset_timestamps, false

set :rvm_type, :system    # :user is the default
set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"") # Read from local system
set :rvm_bin_path, "/usr/local/bin"

require "rvm/capistrano"

set :user, "app_deployer"
set :use_sudo, false
ssh_options[:paranoid] = false;

set :domain, "www.line030.de"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :scm, :git
set :repository,  "git@github.com:line030/RubyProject-BKM.git"
set :branch, "master"
set :deploy_via, :remote_cache

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails un comment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
