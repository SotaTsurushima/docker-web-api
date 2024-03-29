set :output, 'log/crontab.log'

every 1.minutes do
  rake "goods:rakuten"
end
