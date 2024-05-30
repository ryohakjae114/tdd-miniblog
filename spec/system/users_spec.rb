require 'rails_helper'

RSpec.describe 'Registrations', type: :system do
  context '未ログイン時' do
    it 'ログインを押してログインフォームが開くこと' do
      visit_path root_path
      click_on 'ログイン'
      expect(page).to have_current_path new_user_session_path, ignore_query: true
    end

    it 'サインアップを押してサインアップフォームが開くこと' do
      visit root_path
      click_on 'サインアップ'
      expect(page).to have_current_path new_user_registration_path, ignore_query: true
    end
  end
end
