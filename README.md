# Find Open-Source Mentor

### About us
Find Open-Source Mentor is a platform for beginners and experienced developers who own open-source projects or have ideas about such projects and need contributors and collaborators.
#### What the problem?
Beginner programmers have fear about contributing to open-source projects and too-little experience to do their first contributions, so they need someone who has experience and can give tasks, advices and reviews for them.

Experienced developers have open-source projects or project ideas but don't have enough time to work on them, they need someone who can do some tasks and contribute to their projects.

Find Open-Source Mentor is a platform to connect junior and opensorce mentors.

So, here the story begins...

### Domain models
**MVP Goal:**
- Mentor
- Mentee
- Project
- Task

**Near future:**
- Event (Someone - join/publish/contribute to project)
- Level (Mentor can specify task difficulty and it will be shown to begginners or for someone with some experience)
- And many other ideas which we welcome to discuss!

### How can you help us?
  - Issues preparation for beginners
  - Issues descriptions if there are any questions from assignee
  - Pull requests reviewing and commenting

### How you can start contribute?
  - Fork this repo
  - git clone https://github.com/arkency/find-open-source-mentor
  - Go to the find-open-source-mentor directory in your terminal (`cd find-open-source-mentor`)
  - if needed `rvm use ruby-2.6.0` (close and open Terminal to apply changes)
  - `bundle install`
  - Go to https://github.com/settings/tokens and create your personal api_tokens, which are specified in .env.example
  - Create file .env in main directory (same directory where .env.example is) and specify those keys there, for example: 
  * GITHUB_APP_ID=59ef67a3328f769
  * GITHUB_APP_SECRET=901d023bbe4887b96ed54cd05e64a
  - run `rails db:create` and `rails db:migrate`
  - Start local server with `rails s` and go to localhost:3000
  - Choose issue which you want to do and comment with 'I'll take it' in it
  - Create branch `git checkout -b <add-your-new-branch-name>`
  - Prepare solution and don't be afraid of asking questions!
  - Open pull request with your solution to the issue
  - Get review from someone with more experience
  - Fix comments and ask questions
  - Update your pull request with fixed code
  - Get your pull request merged
  - Rest a little and feel proud of yourself that you've done your first open-source contribution!

### Want to join us?
[Join us in slack!](https://join.slack.com/t/findopensourc-prt7834/shared_invite/enQtNzQ5MTIyMzU4NTgzLTg5MGYwMTdhYWIzMGE4ZDc5ZWRlMWI1YTEyNjAzN2ZjNTc4NmMzMjI2NmYzM2U5NTEyMDI2ZTk0MGVhNWU1ZDk)

