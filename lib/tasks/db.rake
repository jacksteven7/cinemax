namespace :db do
  desc "create database task"
  task create_database: :environment do
    p "start"
    ruby "db/tables/001_create_database.rb"
    p "ready"
  end
end