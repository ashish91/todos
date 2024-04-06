require 'simplecov'
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
end
