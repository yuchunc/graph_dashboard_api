# GphPanel

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`
  * Go to `http://localhost:4000/graphiql`

Test with this Query Schema:

```
query Dashboard($id: ID, $tags: [String],$startDt: DateTime!, $endDt: DateTime!) {
  by_id: datum(id: $id, rangeStart: $startDt, rangeEnd: $endDt) {
    id
    createdAt
    displayValue
  }
  by_tags: datum(tags: $tags, rangeStart: $startDt, rangeEnd: $endDt) {
    tags
    createdAt
    displayValue
  }
}
```

Query Variables:
```json
{
  "id": 20,
  "tags": [
    "dog",
    "cat",
    "alpaca"
  ],
  "startDt": "2019-05-24T08:54:41Z",
  "endDt": "2019-06-23T08:55:07Z"
}
```

Note
`startDt` and `endDt` need to be in iso8601 format.
