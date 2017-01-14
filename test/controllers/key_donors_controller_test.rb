require 'test_helper'

class KeyDonorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_donor = key_donors(:one)
  end

  test "should get index" do
    get key_donors_url
    assert_response :success
  end

  test "should get new" do
    get new_key_donor_url
    assert_response :success
  end

  test "should create key_donor" do
    assert_difference('KeyDonor.count') do
      post key_donors_url, params: { key_donor: { Donor_id: @key_donor.Donor_id, Students_id: @key_donor.Students_id, donation_id: @key_donor.donation_id, relationship: @key_donor.relationship } }
    end

    assert_redirected_to key_donor_url(KeyDonor.last)
  end

  test "should show key_donor" do
    get key_donor_url(@key_donor)
    assert_response :success
  end

  test "should get edit" do
    get edit_key_donor_url(@key_donor)
    assert_response :success
  end

  test "should update key_donor" do
    patch key_donor_url(@key_donor), params: { key_donor: { Donor_id: @key_donor.Donor_id, Students_id: @key_donor.Students_id, donation_id: @key_donor.donation_id, relationship: @key_donor.relationship } }
    assert_redirected_to key_donor_url(@key_donor)
  end

  test "should destroy key_donor" do
    assert_difference('KeyDonor.count', -1) do
      delete key_donor_url(@key_donor)
    end

    assert_redirected_to key_donors_url
  end
end
