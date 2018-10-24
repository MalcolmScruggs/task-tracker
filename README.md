# TaskTracker
Design Decisions:

* Tasks can no longer be unassigned. This removes any questions about a user with a manager making 
an unassigned task. It also makes who can delete what clear (ie. user with manager deleting unassigned tasks)

* Only managers can assign tasks to employees they directly manage. The exception is a user with no manager
can self-assign a task (ie CEO of a company) who can additionally assign a task to themselves. This is 
to encompass more use cases for users.

* Only users assigned to a task can change the time information. Other users are not shown the buttons to change it.

* Only managers of the user assigned to the task can make edits to it.







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
