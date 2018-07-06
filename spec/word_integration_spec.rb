require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word and definition input', {:type => :feature}) do
  it('process user entry and displays word in a list') do
    visit('/')
    fill_in('word', :with => 'puppy')
    fill_in('definition', :with => 'a baby dog')
    click_button('Go!')
    expect(page).to have_content('puppy')
  end
end

describe('navigation', {:type => :feature}) do
  it('user click on word on list and displays new page with definition') do
    visit('/')
    click_link('puppy')
    expect(page).to have_content('baby dog')
  end
end
