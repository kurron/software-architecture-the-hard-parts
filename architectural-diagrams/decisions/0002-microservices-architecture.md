# 1. Microservices Architecture

## Status
Accepted

## Context
In order to showcase the Epic Saga pattern, we need to provide atomic database consistency of the system.

## Decision
We will use a Microservices architectural style to implement the distributed services. The simplest style to achieve atomic consistency would to use a monolithic style, such as a Layered Monolith, but the idea is to experience the trade-offs when using the saga in a distributed architecture. A Service-Oriented architecture was also considered, due to the sharing of a database, but that didn't provide any benefits and introduced potential unwanted coupling at the persistence level. 

## Consequences
Each distributed service will connect to the same database but will use their own schema, keeping the database namespace nice and tidy. Since each domain is implemented in its own process, the Orchestrator will have to issue compensating transactions when dealing with service failures. Fault handling is the most difficult part of this saga type and should provide an excellent learning experience. 

## Compliance
Being a learning project, no effort will be made to enforce the use of decision records.

## Notes
