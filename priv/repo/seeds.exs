# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker.Repo.insert!(%TaskTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TaskTracker.Repo
alias TaskTracker.Users.User


Repo.insert!(%User{email: "master@example.com", admin: false})
Repo.insert!(%User{email: "manager@example.com", admin: false, manager: "master@example.com"})
Repo.insert!(%User{email: "jim@example.com", admin: true, manager: "manager@example.com"})
Repo.insert!(%User{email: "alex@example.com", admin: false, manager: "manager@example.com"})
Repo.insert!(%User{email: "rob@example.com", admin: false, manager: "manager@example.com"})

