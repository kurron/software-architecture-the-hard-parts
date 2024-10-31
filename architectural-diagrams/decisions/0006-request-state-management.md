# 1. Use Request State Management to simulate the Isolated portion of ACID

## Status
Accepted

## Context
The Epic Saga requires that we provide atomic consistency across our distributed transaction. Not an easy feat to accomplish.

## Decision
In [Lesson 176 - Compensating Updates Revisited](https://youtu.be/_lZ7JJVNKcc?si=bXe7J52YtHakjFND), Mark Richards provides an alternative to using compensating operations to keep the system in a consistent state.

## Consequences
Each service will be required to use [Apache Ignite](https://ignite.apache.org/), probably behind Spring Boot's cache abstraction, to keep the current state of the in-flight operation's state current. This does a couple things, including allowing the workflow to resume from a failed step if some self-healing has occurred.

## Compliance
Being a learning project, no effort will be made to enforce the use of decision records.

## Notes
