lock '3.3.5'

set :application, 'deal_blog'
set :repo_url, 'https://github.com/tam2015/testeref2015'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'


namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end


# namespace :sidekiq do
#   def sidekiq_pid
#     current_path + '../shared/pids/sidekiq.pid'
#   end

#   def pid_file_exists?
#     test(*("[ -f #{sidekiq_pid} ]").split(' '))
#   end

#   def pid_process_exists?
#     pid_file_exists? and test(*("kill -0 $( cat #{sidekiq_pid} )").split(' '))
#   end

#   task :start do
#     on roles(:app) do
#       if !pid_process_exists?
#         #execute "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} #{fetch(:rbenv_prefix)} bundle exec sidekiq -C config/sidekiq.yml -e #{fetch(:rails_env)} -L log/sidekiq.log -P #{sidekiq_pid} -d"
#         execute "cd /home/deployer/apps/aircrm/current && ~/.rvm/bin/rvm default do bundle exec sidekiq --index 0 --pidfile /home/deployer/apps/aircrm/shared/tmp/pids/sidekiq.pid --environment production --logfile /home/deployer/apps/aircrm/shared/log/sidekiq.log --daemon"
#       end
#     end
#   end

#   task :stop do
#     on roles(:app) do
#       if pid_process_exists?
#         execute "kill `cat #{sidekiq_pid}`"
#         execute "rm #{sidekiq_pid}"
#       end
#     end
#   end

#   task :restart do
#     on roles(:app) do
#       invoke "sidekiq:stop"
#       invoke "sidekiq:start"
#     end
#   end
# end

# after 'deploy:restart', 'sidekiq:start'