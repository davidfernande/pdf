Rails3BootstrapDeviseCancan::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger.const_get(
    ENV['LOG_LEVEL'] ? ENV['LOG_LEVEL'].upcase : 'DEBUG'
  )
  # no loga por pantalla los accesos de base de datos
  config.after_initialize do
    ActiveRecord::Base.logger = Rails.logger.clone
    ActiveRecord::Base.logger.level = Logger::INFO
    
    old_logger = ActiveRecord::Base.logger
    #ActiveRecord::Base.logger = nil
    #To turn it back on:
    #ActiveRecord::Base.logger = old_logger
  
  end

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true
  
  # See everything in the log (default is :info)
  config.log_level = :debug

  # Show full error reports and disable caching
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false



  StatsMix.api_key = ENV["STATMIX_API_KEY"]

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log
  
  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = false

  config.filepicker_rails.api_key = ENV['FILEPICKER_API_KEY']


    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    
 
  RestClient.log = Rails.logger
  
  #SMTP
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'http://staging-yelouusuarios.herokuapp.com/'  }
  config.action_mailer.perform_deliveries = true  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :domain               => "yelouluz.com",
  :port                 => 587,
  :user_name            => 'cercadeti@yelouluz.com',
  :password             => 'Password@0',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }  
  
  
  S3DirectUpload.config do |c|
    c.access_key_id = ENV['ACCESS_KEY_ID']              # your access key id
    c.secret_access_key = ENV['SECRET_ACCESS_KEY']      # your secret access key
    c.bucket = ENV['BUCKET_NAME']                       # your bucket name
    c.region = 's3-eu-west-1'                                      # region prefix of your bucket url (optional), eg. "s3-eu-west-1"
    c.url = "https://#{c.bucket}.s3-eu-west-1.amazonaws.com"    # S3 API endpoint (optional), eg. "https://#{c.bucket}.s3.amazonaws.com/"
  end   
  config.exceptions_app = self.routes
  
end
