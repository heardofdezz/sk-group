require 'test_helper'

class TournamentControllerTest < ActionDispatch::IntegrationTest
  test "should get bracket" do
    get tournament_bracket_url
    assert_response :success
  end

end
