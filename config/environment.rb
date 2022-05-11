# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# cancel rails error field being added
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end