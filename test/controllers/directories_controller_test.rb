require 'test_helper'

class DirectoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @directory = directories(:one)
  end

  test 'should get index' do
    get directories_url, as: :json
    assert_response :success
  end

  test 'should create directory' do
    assert_difference('Directory.count') do
      post directories_url, params: { directory: {} }, as: :json
    end

    assert_response 201
  end

  test 'should show directory' do
    get directory_url(@directory), as: :json
    assert_response :success
  end

  test 'should update directory' do
    patch directory_url(@directory), params: { directory: {} }, as: :json
    assert_response 200
  end

  test 'should destroy directory' do
    assert_difference('Directory.count', -1) do
      delete directory_url(@directory), as: :json
    end

    assert_response 204
  end
end
