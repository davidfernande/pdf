Rails3BootstrapDeviseCancan::Application.configure do
  
  
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
 
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = true

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true


  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )
  
  config.assets.initialize_on_precompile=false # esto es para heroku



  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

 

  StatsMix.api_key = ENV["STATMIX_API_KEY"]

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5
    
  config.filepicker_rails.api_key = ENV['FILEPICKER_API_KEY']
    

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
        
    
  RestClient.log = Rails.logger
  
  S3DirectUpload.config do |c|
    c.access_key_id = ENV['ACCESS_KEY_ID']              # your access key id
    c.secret_access_key = ENV['SECRET_ACCESS_KEY']      # your secret access key
    c.bucket = ENV['BUCKET_NAME']                       # your bucket name
    c.region = 's3-eu-west-1'                                      # region prefix of your bucket url (optional), eg. "s3-eu-west-1"
    c.url = "https://#{c.bucket}.s3-eu-west-1.amazonaws.com"    # S3 API endpoint (optional), eg. "https://#{c.bucket}.s3.amazonaws.com/"
  end   

  #SMTP
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'http://conectados-al-sol.yelouluz.com'  }
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
  
  config.exceptions_app = self.routes
end
