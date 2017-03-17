namespace :morphology do
  task :setup => [
    "db:create",
    "db:migrate",
    "ts:regenerate"
  ]

  desc "Test stemming support"
  task :test => :environment do
    puts ""
    puts "Creating listings…"
    puts "* Listing titled 'camera'"
    camera  = Listing.create! :title => 'camera'
    puts "* Listing titled 'cameras'"
    cameras = Listing.create! :title => 'cameras'

    puts ""
    puts "Searching for 'camera'. Matching titles:"
    Listing.search("camera").each do |listing|
      puts "* #{listing.title}"
    end

    puts ""
    puts "Searching for 'cameras'. Matching titles:"
    Listing.search("cameras").each do |listing|
      puts "* #{listing.title}"
    end

    puts ""
    puts "Removing listings…"
    Listing.all.each &:destroy
  end

  task :packdown => [
    "ts:stop",
    "db:drop"
  ]

  task :all => [
    "morphology:setup",
    "morphology:test",
    "morphology:packdown"
  ]
end
