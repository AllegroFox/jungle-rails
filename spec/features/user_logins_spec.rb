require 'rails_helper'

RSpec.feature "User logs in", type: :feature do

  before :each do
    @user = User.create!(first_name: 'Fox', last_name: 'Socks', email: 'test@test.com', password: 'Foxy', password_confirmation: 'Foxy')
  end

    scenario "They click the login link" do
      #ACT
      visit '/login'
      fill_in 'Email', with: "test@test.com"
      fill_in 'Password', with: "Foxy"
      click_button 'Save Session'

      expect(page).to have_text 'Signed in as Fox'

    end

end
