require 'rails_helper'

RSpec.describe 'Users', type: :system do
  context '未ログイン時' do
    it 'ログインを押してログインフォームが開くこと' do
      visit root_path
      expect(page).not_to have_button 'ログアウト'
      click_on 'ログイン'
      expect(page).to have_current_path new_user_session_path, ignore_query: true
    end

    it 'サインアップを押してサインアップフォームが開くこと' do
      visit root_path
      expect(page).not_to have_button 'ログアウト'
      click_on 'サインアップ'
      expect(page).to have_current_path new_user_registration_path, ignore_query: true
    end
  end

  context 'ログイン時' do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'ログアウトを押してトップページに戻ること' do
      visit root_path
      expect(page).not_to have_content 'ログイン'
      expect(page).not_to have_content 'サインアップ'

      click_on 'ログアウト'

      expect(page).to have_current_path root_path, ignore_query: true
      expect(page).to have_content 'ログイン'
      expect(page).to have_content 'サインアップ'
      expect(page).not_to have_button 'ログアウト'
    end
  end
end
