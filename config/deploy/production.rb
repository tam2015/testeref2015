set :port, 22
set :user, 'deployer'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, "master"

server '107.170.32.49',
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

# server '162.243.254.172',
#   roles: [:app],
#   port: fetch(:port),
#   user: fetch(:user)


# server '107.170.79.199',
#   roles: [:db],
#   port: fetch(:port),
#   user: fetch(:user),
#   primary: true,
#   norelease: true


set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true,
  # auth_methods: %w(publickey),
  user: 'deployer',
}

set :rails_env, :production
set :conditionally_migrate, true



