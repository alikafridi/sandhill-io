desc "This task is called by the Heroku scheduler add-on"

task :update_feed => :environment do
  puts "Updating feed..."
  RssFeedJob.perform_now
  puts "done."
end

task :send_reminders => :environment do
  puts "Send Reminders..."
  #User.send_reminders
end