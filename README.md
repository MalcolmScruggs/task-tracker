# TaskTracker
Design Decisions:

* Tasks can no longer be unassigned. This removes any questions about a user with a manager making 
an unassigned task. It also makes who can delete what clear (ie. user with manager deleting unassigned tasks)

* Only managers can assign tasks to employees they directly manage. The exception is a user with no manager
can self-assign a task (ie CEO of a company) who can additionally assign a task to themselves. This is 
to encompass more use cases for users.







Data
* Users have a unique username (email) enforced by unique constraint on database
* Verification not done on email's yet (currently just set as a unique username)
* Tasks have at most one user assigned to them, enforced by reference
* Tasks must have title and description
* Tasks can have time worked on and not be complete, and time can be set to any
positive integer, enforced by constraint

UI
* First screen is a registration page (to create a user)
* "Home page" is the list of all tasks
* Logging in takes user to the tasks screen, logging out (or failed registration) takes them to registration
* Incrementing time is enforced by increments on form
* Trying to assign a user that doesn't exist to a task fails

## Phoenix Instructions
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
