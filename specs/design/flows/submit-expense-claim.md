# Submit an expense claim

An Employee uploads a receipt, the Receipt Reader extracts its data, and the
Employee reviews and submits the claim to their manager — unless the receipt
is flagged as gambling or betting, in which case it cannot be submitted.

```mermaid
sequenceDiagram
    actor Employee
    participant expense-webapp
    participant receipt-reader
    participant expense-api

    Employee->>expense-webapp: upload receipt photo/PDF
    expense-webapp->>receipt-reader: extract claim data
    receipt-reader-->>expense-webapp: merchant, date, total, gamblingFlagged

    alt gamblingFlagged
        expense-webapp-->>Employee: blocked — gambling/betting not claimable
    else
        Employee->>expense-webapp: correct fields, add note, submit
        expense-webapp->>expense-api: create claim
        expense-api-->>expense-webapp: claim submitted
    end
```

