require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    select '2000', :from => 'Birthdate'
    select '01', :from => 'Birthdate'
    select '01', :from => 'Birthdate'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Birthdate' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end
end
