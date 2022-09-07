require 'rails_helper'

RSpec.describe 'Groups new page', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = User.create(name: 'User 1', email: 'user@yahoo.com', password: '123456')
    sign_in @user
    visit new_group_path
  end

  it 'should display welcoming message' do
    expect(page).to have_content('Add Group')
  end

  it 'should display all fields' do
    find_field 'Name'
    find_field 'Icon'
  end

  it 'should display all links' do
    find_button 'Save'
  end

  it 'should create a group with valid fields' do
    fill_in 'Name', with: 'Squad'
    fill_in 'Icon', with: 'www.image-link.png'
    click_button 'Save'

    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('Squad')
  end

  it 'should not create a group if one of the fields is empty' do
    click_button('Save')

    expect(page).to_not have_content('Successfully created a group.')
  end
end
