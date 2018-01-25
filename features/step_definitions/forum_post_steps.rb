Given (/^that user "([^\"]*)" with password "([^\"]*)" has logged in$/) do |user, password|
  #puts User.count #empty db
  new_user = User.create!(surname: 'Loftus',
                          firstname: 'Chris',
                          email: 'cwl@aber.ac.uk',
                          phone: '01970 622422',
                          grad_year: 1985)
  UserDetail.create!(login: user,
                     password: password,
                     user: new_user)
  #puts User.count #there is 1 user

  #puts page.current_path #no path
  visit new_session_path
  #puts page.current_path

  fill_in 'login', with: user
  fill_in 'password', with: password #found by id
  click_button "Sign in" #found by value


  #make sure user is logged in - if there is not existing user or incorrect credentials it wont pass
  expect(page).to have_no_content("Couldn't log you in as")
  #puts page.current_path
end

When (/^the user creates a new anonymous thread with the title "([^\"]*)" with the body "([^\"]*)"/) do |title, body|

  #visit comments_path
  find("a", :text => 'Forum').click

  find('[id=create_thread]').click

  #fulfill the new thread form
  check "comment[anonymous]"
  fill_in 'comment_title', with: title
  fill_in 'comment_content', with: body
  click_button ("Submit Thread") #found by value

  #verify it has been successfully created
  expect(page).to have_content("Thread was successfully created.")
end

Then (/^the current page should contain a new row containing the data:$/) do |expected_results|

  find('[id=back]').click

  results = [['Title', 'Author', 'Unread posts', 'Total number posts']] +
      page.all('tr.data').map {|tr|
        [tr.find('.title').text,
         tr.find('.uid').text,
         tr.find('.unseen_replies').text,
         tr.find('.replies').text]
      }

  expected_results.diff!(results)

end

Given (/^that another user "([^\"]*)" with password "([^\"]*)" has logged in$/) do |user, password|
  click_button "Logout"

  new_user = User.create!(surname: 'Velikov',
                          firstname: 'Dimitar',
                          email: 'dpv@aber.ac.uk',
                          phone: '01970 622422',
                          grad_year: 2017)
  UserDetail.create!(login: user,
                     password: password,
                     user: new_user)
  click_button "Login"
  fill_in 'login', with: user
  fill_in 'password', with: password #found by id
  click_button "Sign in"
  expect(page).to have_no_content("Couldn't log you in as")
end

When("the user opens the forum page and clicks on the thread with the title {string}") do |thread_title|

  find("a", :text => 'Forum').click
  find("a", :text => thread_title).click

end

Then("the user creates a new thread reply with the text {string}") do |reply_text|
  find("a", :text => "Reply").click
  fill_in 'comment_content', with: reply_text
  click_button ("Create Reply")
  expect(page).to have_content("Reply was successfully created.")
  find('[id=back]').click
end


Then("the current page should contain a row containing the data:") do |expected_table|
  results = [['Title', 'Author', 'Unread posts', 'Total number posts']] +
      page.all('tr.data').map {|tr|
        [tr.find('.title').text,
         tr.find('.uid').text,
         tr.find('.unseen_replies').text,
         tr.find('.replies').text]
      }

  expected_table.diff!(results)
end
When("the current user signs out and the user {string} with password {string} logs back in") do |user, password|
  click_button "Logout"
  click_button "Login"
  fill_in 'login', with: user
  fill_in 'password', with: password #found by id
  click_button "Sign in"
  expect(page).to have_no_content("Couldn't log you in as")
end

Then("the user goes to the forum tab the page should contain a row containing the data:") do |expected_table|

  find("a", :text => 'Forum').click
  results = [['Title', 'Author', 'Unread posts', 'Total number posts']] +
      page.all('tr.data').map {|tr|
        [tr.find('.title').text,
         tr.find('.uid').text,
         tr.find('.unseen_replies').text,
         tr.find('.replies').text]
      }

  expected_table.diff!(results)
end

Then("the user should have one notification") do
  find("p", :text => "Notifications (1)")
end
