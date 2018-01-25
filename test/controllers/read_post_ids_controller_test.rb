require 'test_helper'

class ReadPostIdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @read_post_id = read_post_ids(:one)
  end

  test "should get index" do
    get read_post_ids_url
    assert_response :success
  end

  test "should get new" do
    get new_read_post_id_url
    assert_response :success
  end

  test "should create read_post_id" do
    assert_difference('ReadPostId.count') do
      post read_post_ids_url, params: { read_post_id: { id: @read_post_id.id } }
    end

    assert_redirected_to read_post_id_url(ReadPostId.last)
  end

  test "should show read_post_id" do
    get read_post_id_url(@read_post_id)
    assert_response :success
  end

  test "should get edit" do
    get edit_read_post_id_url(@read_post_id)
    assert_response :success
  end

  test "should update read_post_id" do
    patch read_post_id_url(@read_post_id), params: { read_post_id: { id: @read_post_id.id } }
    assert_redirected_to read_post_id_url(@read_post_id)
  end

  test "should destroy read_post_id" do
    assert_difference('ReadPostId.count', -1) do
      delete read_post_id_url(@read_post_id)
    end

    assert_redirected_to read_post_ids_url
  end
end
