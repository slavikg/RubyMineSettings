Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes                     = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load                        = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled        = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor              = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile                    = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest                     = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  if ENV['CDN_HOST'].present?
    config.action_controller.asset_host = ENV['CDN_HOST']
  end

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags  = [:subdomain, :request_id]

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  # Use a different cache store in production.
  if ENV['MEMCACHIER_SERVERS'].present?
    config.cache_store = :dalli_store
    client = Dalli::Client.new(
      (ENV['MEMCACHIER_SERVERS'] || '').split(','),
      username:             ENV['MEMCACHIER_USERNAME'],
      password:             ENV['MEMCACHIER_PASSWORD'],
      failover:             true,
      socket_timeout:       1.5,
      socket_failure_delay: 0.2,
      value_max_bytes:      10_485_760,
      expires_in:           Settings.cache_expires_in
    )
    config.action_dispatch.rack_cache = { metastore: client, entitystore: client, verbose: true }
  end

  config.public_file_server.headers = {
    'Cache-Control'                => 'public, s-maxage=31536000, maxage=15552000',
    'Expires'                      => 1.year.from_now.to_formatted_s(:rfc822),
    'Access-Control-Allow-Origin'  => '*',
    'Access-Control-Allow-Methods' => 'GET'
  }

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "rails-boilerplate_#{Rails.env}"

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks                            = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation                = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter                             = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Raises error for missing translations
  config.action_view.raise_on_missing_translations = true
end
