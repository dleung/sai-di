require "rvm/capistrano"   


default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :rvm_type, :system

set :application, "capykoa"
set :repository,  "git@github.com:dleung/capykoa.com.git"
set :branch, "master"
set :scm, "git"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :deploy_to, "/home/deploy/capykoa-web"
set :use_sudo, false
set :normalize_asset_timestamps, false
ssh_options[:keys] = %w(~/.ssh/id_dsa) 
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
default_run_options[:pty] = true
role :app, 'capykoa.com'
role :web, 'capykoa.com'
role :db,  'capykoa.com', :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end