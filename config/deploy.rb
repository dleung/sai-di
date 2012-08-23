set :user, 'deploy'
set :domain, 'capykoa.com'
set :application, "capykoa"
 
set :repository, "git@github.com:dleung/capykoa.com.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :scm_verbose, true
set :scm_passphrase, "icecream"  # The deploy user's password
set :deploy_to, "/home/#{user}/#{domain}_server"
set :use_sudo, false
set :deploy_via, :remote_cache
set :normalize_asset_timestamps, false
set :rvm_ruby_string, 'ruby-1.9.3-p194@capykoa'
set :rvm_install_ruby_params, '--1.9'      # for jruby/rbx default to 1.9 mode

before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset

require "rvm/capistrano"

default_run_options[:pty] = true
 
role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
 
namespace :deploy do
  task :start do
     run "bundle install --deployment"
  end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end