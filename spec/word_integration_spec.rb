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
describe('image link input', {:type => :feature}) do
  it('process user entry for image and displays image when entry page is open') do
    visit('/')
    fill_in('word', :with => 'pizza')
    fill_in('definition', :with => 'Cheesy Goodness')
    fill_in('image', :with => 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2016/06/shutterstock_225746563-796x531.jpg')
    click_button('Go!')
    click_link('pizza')
    expect(page).to have_xpath("//img[@src='https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2016/06/shutterstock_225746563-796x531.jpg']")
  end
end
describe('navigation', {:type => :feature}) do
  it('user click on word on list and displays new page with definition') do
    visit('/')
    click_link('puppy')
    expect(page).to have_content('baby dog')
  end
end
describe('add another definition', {:type => :feature}) do
  it('process user input on word page and add new definition') do
    visit('/')
    click_link('puppy')
    fill_in('new-definition', :with => 'a smol doggo')
    click_button('Add!')
    expect(page).to have_content('a smol doggo')
  end
end
