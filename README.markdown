
## About this project

The aims of the project are to:

* Reduce the cost of and increase the accessibility of using and acting on primary and secondary source evidence from Australia immigration detention network.
* Engage new people in the records.
* Preserve access to the evidence for as long as possible in as many ways as possible.

In pursuit of these aims we follow the principles set out on the project's [Principles page](http://detentionlogs.com.au/principles) and also use the open source [Principles for Independent Archives](https://github.com/equivalentideas/independent-archive-principles/blob/master/independent-archive-principles.md) to guide our archive strategy.

Read more about the project on the [About page](http://detentionlogs.com.au/about).

## Data

### Incident Reports

Incident Reports are records of events that occur in immigration detention, recorded by detention centre staff for the Australian Government.

* Learn more about incidents reports at <http://detentionlogs.com.au/data/incidents/about>
* Explore incident reports at <http://detentionlogs.com.au/data/incidents>

Incident reports can be found at [/data/incidents](http://detentionlogs.com.au/data/incidents). Each incident report entry has a unique id in the system, such as [48618](http://detentionlogs.com.au/data/incidents/48618). Incident are also addressable via DIBP designated *incident numbers* using the url pattern http://detentionlogs.com.au/data/incidents/incident_number/$required_incident_number_here, e.g. <http://detentionlogs.com.au/data/incidents/incident_number/1-4T31E1>.

## Technology

Detention Logs is a [Ruby on Rails](http://rubyonrails.org/) (v 3.2.18) application.

Stylesheets are written in [Sass](http://sass-lang.com/) with compass extensions [Singularity](https://github.com/Team-Sass/Singularity), [Modular Scale](https://github.com/Team-Sass/modular-scale) and [Breakpoint](https://github.com/Team-Sass/breakpoint).

Assets are compiled locally using [Grunt](http://gruntjs.com/), rather than Rails' asset pipeline.

See the [Gemfile](https://github.com/DetentionLogs/detentionlogs/blob/Development/Gemfile) for a list of dependencies.
