# Convert hadolint JSON output to Reviewdog Diagnostic Format (rdjson)
# https://github.com/reviewdog/reviewdog/blob/f577bd4b56e5973796eb375b4205e89bce214bd9/proto/rdf/reviewdog.proto
{
  source: {
    name: "bandit",
    url: "https://github.com/PyCQA/bandit"
  },
  diagnostics: . | map({
    message: .issue_text,
    code: {
      value: .test_id,
      url: .issue_cwe.link,
    } ,
    location: {
      path: .filename,
      range: {
        start: {
          line: .line_number,
          column: .col_offset
        }
      }
    },
    severity: (if .issue_severity == "LOW" then "INFO" elif .issue_severity == "MEDIUM" then "warning" elif .issue_severity == "HIGH" then "ERROR" else "UNKNOWN_SEVERITY" end)
  })
}