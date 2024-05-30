FactoryBot.define do
  factory :user do
    email { 'hatt@example.com' }
    password { '1234512345' }
    password_confirmation { '1234512345' }
  end
end
