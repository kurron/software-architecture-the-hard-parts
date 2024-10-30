# 1. Service-Oriented Architecture

## Status
Accepted

## Context
In order to showcase the Epic Saga pattern, we need to provide atomic consistency.

## Decision
We will use a Service-Oriented architectural style to implement the distributed services. The simplest style to achieve atomic consistency would to use a monolithic style, such as a Layered Monolith, but the idea is to experience the trade-offs when using the saga in a distributed architecture.

## Consequences
Each distributed service will connect to the same database but will use their own schema, keeping the database namespace nice and tidy. Since each domain is implemented in its own service, the Orchestrator will have issue compensating transactions when dealing with service failures. Fault handling is the most difficult part of this saga type and should provide an excellent learning experience. 

## Compliance
Being a learning project, no effort will be made to enforce the use of decision records.

## Notes
