set :user, 'root'
set :domain, 'capykoa.com'
set :application, "capykoa"
set :repository,  "git@github.com:dleung/capykoa.com.git"
set :branch, "master"
set :scm, "git"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :scm_passphrase, "zero7one4"
set :deploy_to, "/home/deploy/capykoa-web"
set :use_sudo, false 
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
default_run_options[:pty] = true
ssh_options[:forward_agent] = true


role :app, domain
role :web, domain
role :db,  domain, :primary => true

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
