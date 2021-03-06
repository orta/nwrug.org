require 'test_helper'

class ViewingEventDetailsTest < ActionDispatch::IntegrationTest
  test "displays an event's details" do
    event = events(:august_2015)
    visit event_path(event)

    assert page.has_content?(event.title)
    assert page.has_content?(event.description)
  end
end
