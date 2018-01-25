require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  Capybara.add_selector(:name) do
    xpath { |name| XPath.descendant[XPath.attr(:name).contains(name)] }
  end
end
