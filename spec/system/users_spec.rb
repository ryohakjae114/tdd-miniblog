require 'rails_helper'

RSpec.describe 'Users', type: :system do
  context '未ログイン時' do
    it 'ログインを押してログインフォームが開くこと' do
      visit root_path
      expect(page).not_to have_link '認証情報編集'
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
    let!(:user) { create(:user, name: 'hakjae', password: '1234512345', password_confirmation: '1234512345') }

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

    it '認証情報編集ボタンを押して、フォームから認証情報を変更できる' do
      visit root_path
      click_on '認証情報編集'
      expect(page).to have_current_path edit_user_registration_path, ignore_query: true
      fill_in '名前', with: 'tajimax'
      fill_in '現在のパスワード', with: '1234512345'
      click_on 'Update'

      visit edit_user_registration_path
      expect(page).to have_field '名前', with: 'tajimax'
    end

    it 'アカウント削除を押してトップページに戻ること' do
      visit edit_user_registration_path
      click_on 'アカウント削除'
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end
end
