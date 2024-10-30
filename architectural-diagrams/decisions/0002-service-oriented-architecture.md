# 1. Service-Oriented Architecture

## Status
Accepted

## Context
In order to showcase the Epic Saga pattern, we need to provide atomic consistency.

## Decision
We will use a Service-Oriented architectural style to implement the distributed services. The style uses a shared database model, allowing for atomic database consistency. 

## Consequences
Each distributed service will connect to the same database but will use their own schema, keeping the database namespace nice and tidy. As long as a single database connection is used to access each schema, transactions will be atomic.

## Compliance
Being a learning project, no effort will be made to enforce the use of decision records.

## Notes
