set :user, 'deploy'
set :password, 'capykoa1016'
set :dns_name, "66.175.220.96"
set :domain, 'capykoa.com'
set :application, "sai_di"
 
set :repository, "git@github.com:dleung/sai-di.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :scm_verbose, true
set :scm_passphrase, "icecream"  # The deploy user's password
set :deploy_to, "/home/#{user}/sai_di_server"
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
role :db, domain, :primary => true # This is where Rails migrations will run

after 'deploy:update_code', 'bundler:install', 'assets:precompile'

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "chmod -R 777 #{release_path}/tmp/cache"
    run "mkdir -m 777 #{release_path}/public/uploads"
  end
end

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end


namespace :assets do
  desc "Precompile Assets"
  task :precompile do
    run "cd #{release_path} && rake RAILS_ENV=#{rails_env} assets:precompile"
  end
end

namespace :bundler do
  desc "Run bundler, installing gems"
  task :install do
    run "cd #{release_path} && bundle install --without development test"
  end
end
