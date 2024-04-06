require 'simplecov'
require 'simplecov_small_badge'

SimpleCov.start 'rails'do
  # Configuration options go here
  add_filter %w[
    app/views
    app/channels
    app/jobs/application_job.rb
    app/mailers/application_mailer.rb
    app/helpers/application_helper.rb
    lib/rails
    lib/templates
    bin
    coverage
    log
    test
    vendor
    node_modules
    db
    doc
    public
    storage
    tmp
  ]

  # call SimpleCov::Formatter::BadgeFormatter after the normal HTMLFormatter
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCovSmallBadge::Formatter
  ])
end

# configure any options you want for SimpleCov::Formatter::BadgeFormatter
SimpleCovSmallBadge.configure do |config|
  # does not created rounded borders
  config.rounded_border = true
  # set the background for the title to darkgrey
  config.background = '#ffffcc'
end
