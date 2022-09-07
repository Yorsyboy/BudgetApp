require 'rails_helper'

RSpec.describe 'Operations new page', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = User.create(name: 'User 1', email: 'user@yahoo.com', password: '123456')
    @group = Group.create(name: 'Personal', icon: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          author_id: @user.id)
    sign_in @user
    visit new_operation_path
  end

  it 'should display welcoming message' do
    expect(page).to have_content('Add Operations')
  end

  it 'should display all fields' do
    find_field 'Name'
    find_field 'Amount'
    has_select?('Group', with_options: [@group.name])
  end

  it 'should display all links' do
    find_button 'Save'
  end

  it 'should create an operation with valid fields' do
    fill_in 'Name', with: 'Kfc chicken'
    fill_in 'Amount', with: '55'
    page.select @group.name

    click_button 'Save'

    expect(page).to have_current_path(groups_path)
  end

  it 'should not create an operation with empty fields' do
    click_button 'Save'

    expect(page).to_not have_content('Successfully created an operation.')
  end
end
