require 'test_helper'

class Devise::RegistrationsControllerTest < ActionController::TestCase
  setup do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  def test_successfull_user_registration
    assert_difference -> { User.count }, +1 do
      process :create, method: :post,
                       params: { user: { email:                 'john@example.com',
                                         first_name:            'John',
                                         last_name:             'Doe',
                                         password:              'welcome',
                                         password_confirmation: 'welcome' } }
    end
    assert_redirected_to root_path
  end
end