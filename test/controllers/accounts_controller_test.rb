require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "it gets index" do
    get accounts_url

    assert_response :success
  end

  test "it gets show" do
    subject = accounts(:account)

    get account_url(subject)

    assert_response :success
  end

  test "it gets 404 on show for inexistant account" do
    inexistant_id = 1

    get account_url(inexistant_id)

    assert_redirected_to page_not_found_url
  end

  test "it gets new" do
    get new_account_url

    assert_response :success
  end

  test "it gets edit" do
    subject = accounts(:account)

    get edit_account_url(subject)

    assert_response :success
  end

  test "it gets 404 on edit for nonexistant account" do
    nonexistant_id = 1

    get edit_account_url(nonexistant_id)

    assert_redirected_to page_not_found_url
  end

  test "it posts to create with success" do
    post accounts_url, params: account_params

    refute_empty flash.notice
    assert_redirected_to accounts_url
  end

  test "it posts to create with failure" do
    post accounts_url, params: account_params(reference: nil)

    refute_empty flash.alert
    assert_response :success
  end

  test "it put to update with success" do
    subject = accounts(:account)

    put account_url(subject), params: account_params

    refute_empty flash.notice
    assert_redirected_to accounts_url
  end

  test "it put to update with failure" do
    subject = accounts(:account)

    put account_url(subject), params: account_params(reference: nil)

    refute_empty flash.alert
    assert_response :success
  end

  test "it gets 404 on update for nonexistant account" do
    nonexistant_id = 1

    put account_url(nonexistant_id)

    assert_redirected_to page_not_found_url
  end

  private

  def account_params(attrs = {})
    {
      account: {
        reference: SecureRandom.random_number.to_s[2..50],
        entity: "Mi Banco",
        alias: "Ahorros",
        description: "Cuenta de ahorros personales"
      }.merge(attrs)
    }
  end
end
