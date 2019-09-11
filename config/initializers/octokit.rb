Octokit.configure do |c|
  c.client_id = ENV['GITHUB_APP_ID']
  c.client_secret = ENV['GITHUB_APP_SECRET']
end