require 'rails_helper'
 
feature 'User signs in' do
  given!(:user) { FactoryGirl.create(:user) }
 
  scenario 'with valid credentials' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    expect(page).to have_current_path("/")
  end

  scenario 'with invalid credentials' do
    visit root_path
    fill_in 'Email', with: user.email
    click_button 'Login'
    expect(page).to have_current_path("/users/sign_in")
  end

  scenario 'with invalid credentials' do
    visit root_path
    fill_in 'Password', with: user.password
    click_button 'Login'
    expect(page).to have_current_path("/users/sign_in")
  end
end