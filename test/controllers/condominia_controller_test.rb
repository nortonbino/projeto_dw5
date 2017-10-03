require 'test_helper'

class CondominiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @condominium = condominia(:one)
  end

  test "should get index" do
    get condominia_url
    assert_response :success
  end

  test "should get new" do
    get new_condominium_url
    assert_response :success
  end

  test "should create condominium" do
    assert_difference('Condominium.count') do
      post condominia_url, params: { condominium: { address: @condominium.address, name: @condominium.name, number_proprieties: @condominium.number_proprieties } }
    end

    assert_redirected_to condominium_url(Condominium.last)
  end

  test "should show condominium" do
    get condominium_url(@condominium)
    assert_response :success
  end

  test "should get edit" do
    get edit_condominium_url(@condominium)
    assert_response :success
  end

  test "should update condominium" do
    patch condominium_url(@condominium), params: { condominium: { address: @condominium.address, name: @condominium.name, number_proprieties: @condominium.number_proprieties } }
    assert_redirected_to condominium_url(@condominium)
  end

  test "should destroy condominium" do
    assert_difference('Condominium.count', -1) do
      delete condominium_url(@condominium)
    end

    assert_redirected_to condominia_url
  end
end
