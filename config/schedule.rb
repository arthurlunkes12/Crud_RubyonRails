set :environment, "development"
set :output, "log/cron.log"

every 1.day, at: '9:00 am' do
  rake "rentals:send_warning"
end

every 1.day, at: '12:00 am' do
  rake "rentals:finish_rentals"
end