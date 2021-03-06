ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

require "support/test_password_helper"

ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper

class ActiveSupport::TestCase
  include TestPasswordHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # To make it easier to test date-related features, we travel to a known date.
  # This makes it easier to use fixtures and write tests around the display of
  # the next upcoming event and the behaviour when there is no future event.
  def setup
    travel_to Date.new(2015, 8, 1)
  end

  def teardown
    travel_back
  end
end

class ActionDispatch::IntegrationTest
  include TestPasswordHelper

  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  teardown do
    Capybara.reset_sessions!
  end

  def assert_path(expected_path)
    assert_equal expected_path, page.current_path
  end

  def login_as(user)
    visit signin_path
    fill_in :email, :with => user.email
    fill_in :password, :with => default_password
    click_on 'Sign in'
  end
end
