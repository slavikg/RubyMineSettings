desc 'sets up the project by running migration and populating sample data'
task setup: :environment do
  %w(db:migrate delete_all_records_from_all_tables setup_sample_data).each do |task|
    puts "Invoking rake task: rake #{task}"
    Rake::Task[task].invoke
  end
end

desc 'Deletes all records and populates sample data'
task delete_all_records_from_all_tables: :environment do
  raise 'do not run in production' if Rails.env.production?

  (ActiveRecord::Base.connection.tables - %w(schema_migrations active_record_internal_metadatas)).each do |table|
    table.classify.constantize.delete_all
  end
end

desc 'Setup sample data'
task setup_sample_data: :environment do
  create_user(email: 'user@example.com')
end

def create_user(options = {})
  user_attributes = {
    email:      'admin@example.com',
    password:   'welcome',
    first_name: 'John',
    last_name:  'Smith',
    role:       'admin'
  }
  attributes = user_attributes.merge options
  User.create! attributes
end
