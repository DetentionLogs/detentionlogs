## About this project
Detention Logs is a new independent project committed to transparency and accountability in Australia’s immigration detention network. We aim to support those reporting on and discussing these issues by breaking through misinformation and political spin.

Immigration detention is one of the most hotly debated, contested and emotional topics in Australia, but journalists’ access to detention centres is limited and information from the inside is scarce. Public policy surrounding asylum seekers and immigration should be shaped by informed opinions, and our mission is to arm the public with those vital facts to raise the standard of discussion.

The aims of the project are to:

* Reduce the cost of and increase the accessibility of using and acting on primary and secondary source evidence from Australia immigration detention network.
* Engage new people in the records.
* Preserve access to the evidence for as long as possible in as many ways as possible.

In pursuit of these aims we follow the principles set out on the project's [Principles page](http://detentionlogs.com.au/principles) and also use the open source [Principles for Independent Archives](https://github.com/equivalentideas/independent-archive-principles/blob/master/independent-archive-principles.md) to guide our archive strategy.

Read more about the project on the [About page](http://detentionlogs.com.au/about).

## Development

### Contributing 

If you are interested in contributing to the development of Detention Logs please start by looking to see what [Issues](https://github.com/DetentionLogs/detentionlogs/issues) are currently open. It is very helpful to have people joining the discussion or sugggesting ideas. If you find something simple that you know you can fix or improve, feel free to make the change and send through a pull request.

If you want to contribute an enhancement or a fix:

1. Fork the project on GitHub.
2. Make a topic branch from the production branch.
3. Make your changes and test.
4. Commit the changes without making changes to any files that aren't related to your enhancement or fix.
5. Send a pull request against the production branch.

### Technology

Detention Logs is a [Ruby on Rails](http://rubyonrails.org/) (v 3.2.18) application.

Stylesheets are written in [Sass](http://sass-lang.com/) with compass extensions [Singularity](https://github.com/Team-Sass/Singularity), [Modular Scale](https://github.com/Team-Sass/modular-scale) and [Breakpoint](https://github.com/Team-Sass/breakpoint).

Assets are compiled locally using [Grunt](http://gruntjs.com/), rather than Rails' asset pipeline.

See the [Gemfile](https://github.com/DetentionLogs/detentionlogs/blob/Development/Gemfile) for a list of dependencies.


### Setup

You should have Ruby, Bundler, Git, and Postgres installed.

Postgres should be configured to allow you to connect without a username and password. Setting your authentication method to `peer` in your `pg_hba.conf` file is really handy for local development (don't set this in production though!).

Then:

* Clone the repository - `git clone https://github.com/DetentionLogs/detentionlogs.git && cd detentionlogs`
* Install Gems - `bundle install`
* Copy dotenv configuration - `cp .env-example .env`
* Setup databases - `bundle exec rake db:setup`
* Run tests - `bundle exec rake`
* Start server - `bundle exec rails server`

## Data

### Incident Reports

Incident Reports are records of events that occur in immigration detention, recorded by detention centre staff for the Australian Government.

* Learn more about incidents reports at <http://detentionlogs.com.au/data/incidents/about>
* Explore incident reports at <http://detentionlogs.com.au/data/incidents>

Incident reports can be found at [/data/incidents](http://detentionlogs.com.au/data/incidents). Each incident report entry has a unique id in the system, such as [48618](http://detentionlogs.com.au/data/incidents/48618). Incident are also addressable via DIBP designated *incident numbers* using the url pattern http://detentionlogs.com.au/data/incidents/incident_number/$required_incident_number_here, e.g. <http://detentionlogs.com.au/data/incidents/incident_number/1-4T31E1>.

## License

Copyright (C) 2013 Detention Logs

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://gnu.org/licenses/agpl.html>.
