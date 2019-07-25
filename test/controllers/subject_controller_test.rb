# frozen_string_literal: true

require 'test_helper'

class SubjectControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get subject_show_url
    assert_response :success
  end
end
