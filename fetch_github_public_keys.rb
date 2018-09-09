require 'yaml'
require 'open-uri'

config = YAML.load_file('config.yml')
gh_users = config['github_user_names']

gh_keys = gh_users.map { |u| open("https://github.com/#{u}.keys").read }.join('')

File.open("#{Dir.home}/.ssh/public_keys.pub", 'w') do |f|
  f.puts(gh_keys)
end